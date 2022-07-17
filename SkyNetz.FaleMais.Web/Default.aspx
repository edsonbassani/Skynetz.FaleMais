<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SkyNetz.FaleMais.Web._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>SkyNetz FaleMais</h1>
        <p class="lead">Compare as vantagens de nossos planos</p>
        <p><a href="#plans" class="btn btn-primary btn-lg">Comparar &raquo;</a></p>
    </div>
    <div class="row" id="plans">
    </div>
    <div class="row">
        <p></p>
    </div>
    <div class="row">
        <p></p>
    </div>
    <div class="row">
        <p></p>
    </div>
    <div class="row" id="fares">
    </div>
    <div class="row col-md-12" id="calculadora" style="width:103%;display:none;">
        <h2>Calculadora</h2>
        <table class="table table-hover">
            <thead>
                <tr>
                    <th scope="col">Plano</th>
                    <th scope="col">Origem</th>
                    <th scope="col">Destino</th>
                    <th scope="col">Minutos</th>
                    <th scope="col"></th>
                    <th scope="col">Valor (R$)</th>
                </tr>
                <tr>
                    <td>
                        <select id="selPlan">
                            <option value="1">Fale Mais 30</option>
                            <option value="2" selected>Fale Mais 60</option>
                            <option value="3">Fale Mais 120</option>
                            <option value="4">Sem Fale Mais</option>
                        </select>
                    </td>
                    <td>
                        <select id="selOrigin">
                            <option value="11" selected>011</option>
                            <option value="18">018</option>
                        </select></td>
                    <td>
                        <select id="selDestination">
                            <option value="11">011</option>
                            <option value="16">016</option>
                            <option value="17" selected>017</option>
                        </select></td>
                    <td><input type="number" id="txtMinutes" value="100"  /></td>
                    <td><a class="btn btn-primary" onclick="calculateFare();" href="#calculadora">Calcular &raquo;</a></td>
                    <td><span id="total">R$ 0,00</span></td>
                </tr>
            </thead>
        </table>
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
                url: 'https://localhost:44307/api/fares/list/',
                method: 'POST',
                contentType: "application/json",
                dataType: 'json',
                data: planId.toString(),
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
            $('#calculadora').css('display', 'block');
        }
        function calculateFare() {
            var planId = $("#selPlan option:selected").val();
            var origin = $("#selOrigin option:selected").val();
            var destination = $("#selDestination option:selected").val();
            var minutes = $('#txtMinutes').val() === '' ? 0 : $('#txtMinutes').val();
            var info = planId + '|' +  origin + '|' + destination + '|' + minutes;

            $.ajax({
                url: 'https://localhost:44307/api/fares/calc/',
                method: 'POST',
                contentType: "application/json",
                data: "'" + info.toString() + "'",
                success: function (data) {
                    $('#total').text('R$ ' + parseFloat(data).toFixed(2));
                    $('#total').css('font-weight', 'bold').css('color', 'green').css('font-size', '2em');

                }
            })
        }

        $(document).ready(function () {
            getPlans();
        });

    </script>
</asp:Content>


