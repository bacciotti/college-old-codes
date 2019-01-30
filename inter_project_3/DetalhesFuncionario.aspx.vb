
Partial Class DetalhesFuncionario
    Inherits System.Web.UI.Page

    Protected Sub DetailsDoador_ItemDeleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewDeletedEventArgs) Handles DetailsFunc.ItemDeleted
        Response.Redirect("~/DeletadoComSucesso.aspx")
    End Sub
End Class
