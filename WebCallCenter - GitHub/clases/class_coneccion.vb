Imports System.Data.SqlClient
Imports System.IO
Imports System.Security.Cryptography

Public Class class_coneccion

    Public Function consulta_login(usuario As String, contrasenia As String) As DataSet
        Dim ds As New DataSet
        Dim conexion As New SqlConnection
        Dim cmd As New SqlCommand
        Dim dataAdapter As SqlDataAdapter
        cmd.CommandTimeout = 300
        Conexion_sql_turnos(conexion, True)
        Try
            cmd.CommandText = "RPT_SP_CONSULTAS_CALLCENTER_AUTOMATICO"
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Connection = conexion
            cmd.Parameters.AddWithValue("@OPCION", 1)
            cmd.Parameters.AddWithValue("@USUARIO", usuario)
            cmd.Parameters.AddWithValue("@CONTRASENIA", Encriptar3S(contrasenia))
            dataAdapter = New SqlDataAdapter(cmd)
            dataAdapter.Fill(ds)
        Catch ex As Exception
            Throw ex
        End Try
        Conexion_sql_turnos(conexion, False)
        Return ds
    End Function

    Public Function consulta_tablero(usuario As String) As DataSet
        Dim ds As New DataSet
        Dim conexion As New SqlConnection
        Dim cmd As New SqlCommand
        Dim dataAdapter As SqlDataAdapter
        cmd.CommandTimeout = 300
        Conexion_sql_intermedio(conexion, True)
        Try
            cmd.CommandText = "RPT_SP_CONSULTAS_CALLCENTER_AUTOMATICO"
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Connection = conexion
            cmd.Parameters.AddWithValue("@OPCION", 1)
            cmd.Parameters.AddWithValue("@USUARIO", usuario)
            dataAdapter = New SqlDataAdapter(cmd)
            dataAdapter.Fill(ds)
        Catch ex As Exception
            Throw ex
        End Try
        Conexion_sql_intermedio(conexion, False)
        Return ds
    End Function

    Public Function consulta_creacion_inicial(opcion As Integer, usuario As String, convenio As String) As DataSet
        Dim ds As New DataSet
        Dim conexion As New SqlConnection
        Dim cmd As New SqlCommand
        Dim dataAdapter As SqlDataAdapter
        cmd.CommandTimeout = 300
        Conexion_sql_reporte(conexion, True)
        Try
            cmd.CommandText = "SP_RPT_CONSULTAS_CALLCENTER_CREACION"
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Connection = conexion
            cmd.Parameters.AddWithValue("@OPCION", opcion)
            cmd.Parameters.AddWithValue("@USUARIO", usuario)
            cmd.Parameters.AddWithValue("@CONVENIO", convenio)
            dataAdapter = New SqlDataAdapter(cmd)
            dataAdapter.Fill(ds)
        Catch ex As Exception

        End Try
        Conexion_sql_reporte(conexion, False)
        Return ds
    End Function

    Public Function consulta_creacion_filtrado(opcion As Integer, usuario As String, convenio As String,
                                               campania As String, fecha As String) As DataSet
        Dim ds As New DataSet
        Dim conexion As New SqlConnection
        Dim cmd As New SqlCommand
        Dim dataAdapter As SqlDataAdapter
        cmd.CommandTimeout = 300
        Conexion_sql_reporte(conexion, True)
        Try
            cmd.CommandText = "SP_RPT_CONSULTAS_CALLCENTER_CREACION"
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Connection = conexion
            cmd.Parameters.AddWithValue("@OPCION", opcion)
            cmd.Parameters.AddWithValue("@USUARIO", usuario)
            cmd.Parameters.AddWithValue("@CONVENIO", convenio)
            cmd.Parameters.AddWithValue("@CAMPANIA", campania)
            cmd.Parameters.AddWithValue("@FECHA", fecha)
            dataAdapter = New SqlDataAdapter(cmd)
            dataAdapter.Fill(ds)
        Catch ex As Exception

        End Try
        Conexion_sql_reporte(conexion, False)
        Return ds
    End Function






    'Function actualizaordenespendientes(ByVal orden As String, ByVal estado As Integer, ByVal meses As Integer,
    '                                    ByVal tipo_credito As String, ByVal trama As String, ByVal banco As String,
    '                                    ByVal bin As String, ByVal transaccionid As String) As Boolean
    '    Dim conexion As SqlClient.SqlConnection = Nothing
    '    Dim myCommand As SqlClient.SqlCommand = Nothing
    '    Dim base As New CommandApp
    '    Dim stringConexion As String = base.getStringConnection()
    '    Try
    '        conexion = New SqlConnection(stringConexion)
    '        conexion.Open()
    '        'transaction = conexion.BeginTransaction()
    '        myCommand = New SqlCommand("REPORTES.DBO.RPT_SP_PROCESO_SONDA_NUEVO", conexion)
    '        myCommand.CommandTimeout = 1000
    '        myCommand.CommandType = CommandType.StoredProcedure
    '        myCommand.Parameters.Add("@ORDENSEC", SqlDbType.VarChar).Value = orden
    '        myCommand.Parameters.Add("@ESTADO", SqlDbType.VarChar).Value = estado
    '        myCommand.Parameters.Add("@MESES", SqlDbType.VarChar).Value = meses
    '        myCommand.Parameters.Add("@TIPO_CREDITO", SqlDbType.VarChar).Value = tipo_credito
    '        myCommand.Parameters.Add("@BANCO", SqlDbType.VarChar).Value = tipo_credito
    '        myCommand.Parameters.Add("@BIN", SqlDbType.VarChar).Value = tipo_credito
    '        myCommand.Parameters.Add("@TRANSACCION", SqlDbType.VarChar).Value = tipo_credito
    '        myCommand.Parameters.Add("@TRAMA", SqlDbType.VarChar).Value = trama
    '        myCommand.ExecuteNonQuery()
    '        Return True
    '    Catch ex As Exception
    '        Return False
    '    Finally
    '        conexion.Close()
    '    End Try
    '    conexion.Dispose()
    'End Function

#Region "Conexion"

    Private Sub Conexion_sql_turnos(ByVal conexion As SqlConnection, ByVal conectar As Boolean)
        Dim prjcstr As String = ConfigurationManager.AppSettings.Get("ProyectName").ToString()
        Dim clavesc As String = Convierte_decrypt(ConfigurationManager.AppSettings.Get("cl_secret").ToString(), prjcstr, prjcstr)
        Dim algortm As String = Convierte_decrypt(ConfigurationManager.AppSettings.Get("galgoritm").ToString(), prjcstr, prjcstr)

        Dim servers As String = Convierte_decrypt(ConfigurationManager.AppSettings.Get("Srv_str_tur").ToString(), clavesc, algortm)
        Dim usuario As String = Convierte_decrypt(ConfigurationManager.AppSettings.Get("Usr_str_tur").ToString(), clavesc, algortm)
        Dim claveiq As String = Convierte_decrypt(ConfigurationManager.AppSettings.Get("Pwd_str_tur").ToString(), clavesc, algortm)
        Dim puertos As String = Convierte_decrypt(ConfigurationManager.AppSettings.Get("Prt_str_tur").ToString(), clavesc, algortm)
        Dim basesql As String = Convierte_decrypt(ConfigurationManager.AppSettings.Get("Bds_str_tur").ToString(), clavesc, algortm)
        Try
            If conectar Then
                Dim cadena As String = String.Format("data source={0},{4};initial catalog={1};user id={2};password={3}", servers, basesql, usuario, claveiq, puertos)
                conexion.ConnectionString = cadena
                conexion.Open()
            Else
                conexion.Close()
            End If
        Catch ex As Exception
            Throw ex
        End Try
    End Sub

    Private Sub Conexion_sql_reporte(ByVal conexion As SqlConnection, ByVal conectar As Boolean)
        Dim prjcstr As String = ConfigurationManager.AppSettings.Get("ProyectName").ToString()
        Dim clavesc As String = Convierte_decrypt(ConfigurationManager.AppSettings.Get("cl_secret").ToString(), prjcstr, prjcstr)
        Dim algortm As String = Convierte_decrypt(ConfigurationManager.AppSettings.Get("galgoritm").ToString(), prjcstr, prjcstr)

        Dim servers As String = Convierte_decrypt(ConfigurationManager.AppSettings.Get("Srv_str_rep").ToString(), clavesc, algortm)
        Dim usuario As String = Convierte_decrypt(ConfigurationManager.AppSettings.Get("Usr_str_rep").ToString(), clavesc, algortm)
        Dim claveiq As String = Convierte_decrypt(ConfigurationManager.AppSettings.Get("Pwd_str_rep").ToString(), clavesc, algortm)
        Dim puertos As String = Convierte_decrypt(ConfigurationManager.AppSettings.Get("Prt_str_rep").ToString(), clavesc, algortm)
        Dim basesql As String = Convierte_decrypt(ConfigurationManager.AppSettings.Get("Bds_str_rep").ToString(), clavesc, algortm)
        Try
            If conectar Then
                Dim cadena As String = String.Format("data source={0},{4};initial catalog={1};user id={2};password={3}", servers, basesql, usuario, claveiq, puertos)
                conexion.ConnectionString = cadena
                conexion.Open()
            Else
                conexion.Close()
            End If
        Catch ex As Exception
            Throw ex
        End Try
    End Sub

    Private Sub Conexion_sql_intermedio(ByVal conexion As SqlConnection, ByVal conectar As Boolean)
        Dim prjcstr As String = ConfigurationManager.AppSettings.Get("ProyectName").ToString()
        Dim clavesc As String = Convierte_decrypt(ConfigurationManager.AppSettings.Get("cl_secret").ToString(), prjcstr, prjcstr)
        Dim algortm As String = Convierte_decrypt(ConfigurationManager.AppSettings.Get("galgoritm").ToString(), prjcstr, prjcstr)
        Dim servers As String = Convierte_decrypt(ConfigurationManager.AppSettings.Get("Srv_str_nig").ToString(), clavesc, algortm)
        Dim usuario As String = Convierte_decrypt(ConfigurationManager.AppSettings.Get("Usr_str_nig").ToString(), clavesc, algortm)
        Dim claveiq As String = Convierte_decrypt(ConfigurationManager.AppSettings.Get("Pwd_str_nig").ToString(), clavesc, algortm)
        Dim puertos As String = Convierte_decrypt(ConfigurationManager.AppSettings.Get("Prt_str_nig").ToString(), clavesc, algortm)
        Dim basesql As String = "BASE_INTERMEDIA" 'Convierte_decrypt(ConfigurationManager.AppSettings.Get("Bds_str_nig").ToString(), clavesc, algortm)

        usuario = usuario.Insert(7, "l")
        'basesql = basesql.Insert(5, "_")
        'basesql = basesql.Insert(8, "l")
        Try
            If conectar Then
                Dim cadena As String = String.Format("data source={0},{4};initial catalog={1};user id={2};password={3}", servers, basesql, usuario, claveiq, puertos)
                conexion.ConnectionString = cadena
                conexion.Open()
            Else
                conexion.Close()
            End If
        Catch ex As Exception
            Throw ex
        End Try
    End Sub

#End Region

#Region "Crypto"

    Private Function Convierte_decrypt(parametro As String, clave_secreta As String, algoritm As String) As String
        Dim cadenabyte As Byte() = System.Text.Encoding.Unicode.GetBytes(parametro)
        Dim cadenastr As String = Decrypt(cadenabyte, clave_secreta, algoritm)
        Return cadenastr
    End Function

    Private Function Convierte_encrypt(parametro As String, clave_secreta As String, algoritm As String) As String
        Dim cadenabyte As Byte() = Encrypt(parametro, clave_secreta, algoritm)
        Dim cadenastr As String = System.Text.Encoding.Unicode.GetString(cadenabyte)
        Return cadenastr
    End Function

    Private Function Encrypt(ByVal plainText As String, ByVal secretKey As String, algoritm As String) As Byte()
        Dim encryptedPassword As Byte() = Nothing
        Try
            Using outputStream As MemoryStream = New MemoryStream()
                Dim algorithm As RijndaelManaged = getAlgorithm(secretKey, algoritm)
                Using cryptoStream As CryptoStream = New CryptoStream(outputStream, algorithm.CreateEncryptor(), CryptoStreamMode.Write)
                    Dim inputBuffer() As Byte = Encoding.Unicode.GetBytes(plainText)
                    cryptoStream.Write(inputBuffer, 0, inputBuffer.Length)
                    cryptoStream.FlushFinalBlock()
                    encryptedPassword = outputStream.ToArray()
                End Using
            End Using
        Catch ex As Exception
            Dim a As Int16
        End Try
        Return encryptedPassword
    End Function

    Private Function Decrypt(ByVal encryptedBytes As Byte(), ByVal secretKey As String, algoritm As String) As String
        Dim plainText As String = Nothing
        Try
            Using inputStream As MemoryStream = New MemoryStream(encryptedBytes)
                Dim algorithm As RijndaelManaged = getAlgorithm(secretKey, algoritm)
                Using cryptoStream As CryptoStream = New CryptoStream(inputStream, algorithm.CreateDecryptor(), CryptoStreamMode.Read)
                    Dim outputBuffer(0 To CType(inputStream.Length - 1, Integer)) As Byte
                    Dim readBytes As Integer = cryptoStream.Read(outputBuffer, 0, CType(inputStream.Length, Integer))
                    plainText = Encoding.Unicode.GetString(outputBuffer, 0, readBytes)
                End Using
            End Using
        Catch ex As Exception
            Dim a As Int16
        End Try
        Return plainText
    End Function

    Private Function getAlgorithm(ByVal secretKey As String, salt As String) As RijndaelManaged
        Const keySize As Integer = 256

        Dim keyBuilder As Rfc2898DeriveBytes = New Rfc2898DeriveBytes(secretKey, Encoding.Unicode.GetBytes(salt))
        Dim algorithm As RijndaelManaged = New RijndaelManaged()
        algorithm.KeySize = keySize
        algorithm.IV = keyBuilder.GetBytes(CType(algorithm.BlockSize / 8, Integer))
        algorithm.Key = keyBuilder.GetBytes(CType(algorithm.KeySize / 8, Integer))
        algorithm.Padding = PaddingMode.PKCS7
        Return algorithm
    End Function

    Function Encriptar3S(ByVal password As String) As Byte()
        Encriptar3S = Nothing
        Dim objSha256 As New SHA256Managed
        Dim objTemporal As Byte()
        Try
            objTemporal = System.Text.Encoding.UTF8.GetBytes(password)
            objTemporal = objSha256.ComputeHash(objTemporal)
            Return objTemporal
        Catch ex As Exception
            Throw
        Finally
            objSha256.Clear()
        End Try
    End Function

#End Region

End Class
