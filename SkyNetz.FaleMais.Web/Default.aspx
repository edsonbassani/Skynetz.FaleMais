<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SkyNetz.FaleMais.Web._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>SkyNetz FaleMais</h1>
        <p class="lead">Compare as vantagens de nossos planos</p>
        <p><a href="#plans" class="btn btn-primary btn-lg">Comparar &raquo;</a></p>
    </div>
    <div class="row" id="plans">
        
    </div>
    <div class="row"><p></p></div>
    <div class="row"><p></p></div>
    <div class="row"><p></p></div>
    <div class="row" id="fares">
       
    </div>
    <script type="text/javascript">
        function getPlans() {
                $.ajax({
                    url: 'https://localhost:44307/api/plans/list',
                    method: 'POST',
                    contentType: "application/json",
                    dataType: 'json',
                    success: function (data) {
                        $.each(data, function (index) {
                            if (index < data.length - 1) {
                            $("#plans").append(
                                '<div class="col-md-4">' +
                                '<h2>' + data[index].Description + '</h2>' +
                                '<p class="text-justify">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ' +
                                'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.Duis aute irure dolor ' +
                                'in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.Excepteur sint occaecat cupidatat non proident, ' +
                                'sunt in culpa qui officia deserunt mollit anim id est laborum.</p > ' +
                                '<p><a class="btn btn-success" onclick="getComparison(' + data[index].Id + ',' + "'" + data[index].Description + "'" + ')" href="#fares" >Veja mais &raquo;</a></p>' +
                                '</div>'
                                );
                            }
                        });
                    }
                })
        }
        function getComparison(planId, planDescription) {
            $.ajax({
                url: 'https://localhost:44307/api/fares/' + planId,
                method: 'POST',
                contentType: "application/json",
                dataType: 'json',
                success: function (data) {
                    $("#fares").html(
                        '<div class="row col-md-12" style="margin-left:0px;">' +
                        '<h2>Tarifação</h2>' +
                        '<table class="table table-hover">' +
                            '<thead>' + 
                            '<tr>' +
                                '<th scope="col">Origem</th>' +
                                '<th scope="col">Destino</th>' +
                                '<th scope="col">Minutos</th>' +
                                '<th scope="col">' + planDescription + '*</th>' +
                                '<th scope="col">Sem Fale Mais</th>' +
                        '</tr>' +
                        '</thead>' +
                            '<tr>' +
                                '<td>0' + data.Origin + '</td>' +
                                '<td>0' + data.Destination + '</td>' +
                                '<td>' + data.Time + '</td>' +
                                '<td>R$ ' + parseFloat(data.DiscountedValue).toFixed(2) + '</td>' +
                                '<td>R$ ' + parseFloat(data.FullValue).toFixed(2) + '</td>' +
                            '</tr>' +
                                '<tfoot>' + 
                                    '<tr>' +
                                        '<td>' +
                                            '*Aplica-se 10% sobre o minuto excedente + impostos' +
                                        '</td>' +
                                        '<td></td>' +
                                        '<td></td>' +
                                        '<td></td>' +
                                        '<td></td>' +
                                    '</tr>' +
                                '<tfoot>' +
                            '</table>' +
                        '</div>' 
                     );
                }
            })
        }

        $(document).ready(function () {
            getPlans();
        });
        
    </script>
</asp:Content>


