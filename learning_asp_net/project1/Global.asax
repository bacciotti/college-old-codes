<%@ Application Language="VB" %>
<%@ Import Namespace="System.Security.Principal" %>

<script runat="server">

    Sub Application_Start(ByVal sender As Object, ByVal e As EventArgs)
        ' Code that runs on application startup
    End Sub
    
    Sub Application_End(ByVal sender As Object, ByVal e As EventArgs)
        ' Code that runs on application shutdown
    End Sub
        
    Sub Application_Error(ByVal sender As Object, ByVal e As EventArgs)
        ' Code that runs when an unhandled error occurs
    End Sub

    Sub Session_Start(ByVal sender As Object, ByVal e As EventArgs)
        ' Code that runs when a new session is started
    End Sub

    Sub Session_End(ByVal sender As Object, ByVal e As EventArgs)
        ' Code that runs when a session ends. 
        ' Note: The Session_End event is raised only when the sessionstate mode
        ' is set to InProc in the Web.config file. If session mode is set to StateServer 
        ' or SQLServer, the event is not raised.
    End Sub
    
     
    Sub Application_AuthenticateRequest(ByVal sender As Object, ByVal e As EventArgs)
        If Not (HttpContext.Current.User Is Nothing) Then
 
        End If
        
        If Not (HttpContext.Current.User Is Nothing) Then
            If Not (HttpContext.Current.User.Identity Is Nothing) Then
 
            End If
        End If
        If Not (HttpContext.Current.User Is Nothing) Then
            If Not (HttpContext.Current.User.Identity Is Nothing) Then
                If (TypeOf HttpContext.Current.User.Identity Is FormsIdentity) Then
 
                End If
            End If
        End If
         
        If Not (HttpContext.Current.User Is Nothing) Then
            If Not (HttpContext.Current.User.Identity Is Nothing) Then
                If (TypeOf HttpContext.Current.User.Identity Is FormsIdentity) Then
                    Dim identidade As FormsIdentity
                    identidade = CType(HttpContext.Current.User.Identity, FormsIdentity)
                End If
            End If
        End If
 
         
        If Not (HttpContext.Current.User Is Nothing) Then
            If Not (HttpContext.Current.User.Identity Is Nothing) Then
                If (TypeOf HttpContext.Current.User.Identity Is FormsIdentity) Then
                    Dim identidade As FormsIdentity
                    identidade = CType(HttpContext.Current.User.Identity, FormsIdentity)
 
                    Dim ticket As FormsAuthenticationTicket
                    ticket = identidade.Ticket
                End If
            End If
        End If
 
        If Not (HttpContext.Current.User Is Nothing) Then
            If Not (HttpContext.Current.User.Identity Is Nothing) Then
                If (TypeOf HttpContext.Current.User.Identity Is FormsIdentity) Then
                    Dim identidade As FormsIdentity
                    identidade = CType(HttpContext.Current.User.Identity, FormsIdentity)
 
                    Dim ticket As FormsAuthenticationTicket
                    ticket = identidade.Ticket
                     
                    Dim dadosDoUsuario As String
                    dadosDoUsuario = ticket.UserData
                End If
            End If
        End If
 
        If Not (HttpContext.Current.User Is Nothing) Then
            If Not (HttpContext.Current.User.Identity Is Nothing) Then
                If (TypeOf HttpContext.Current.User.Identity Is FormsIdentity) Then
                    Dim identidade As FormsIdentity
                    identidade = CType(HttpContext.Current.User.Identity, FormsIdentity)
 
                    Dim ticket As FormsAuthenticationTicket
                    ticket = identidade.Ticket
                     
                    Dim dadosDoUsuario As String
                    dadosDoUsuario = ticket.UserData
                       
                    Dim papeis As String()
                    papeis = dadosDoUsuario.Split(",")
                End If
            End If
        End If
        
         
        If Not (HttpContext.Current.User Is Nothing) Then
            If Not (HttpContext.Current.User.Identity Is Nothing) Then
                If (TypeOf HttpContext.Current.User.Identity Is FormsIdentity) Then
                    Dim identidade As FormsIdentity
                    identidade = CType(HttpContext.Current.User.Identity, FormsIdentity)
 
                    Dim ticket As FormsAuthenticationTicket
                    ticket = identidade.Ticket
                     
                    Dim dadosDoUsuario As String
                    dadosDoUsuario = ticket.UserData
                       
                    Dim papeis As String()
                    papeis = dadosDoUsuario.Split(",")
                     
                    HttpContext.Current.User = New GenericPrincipal(identidade, papeis)
                End If
            End If
        End If
 
        
    End Sub

 
</script>