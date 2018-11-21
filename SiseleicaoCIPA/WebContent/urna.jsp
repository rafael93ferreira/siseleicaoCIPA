<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="background.css" rel="stylesheet">
    </head>
    
    <body style="background-image: linear-gradient(to left, yellow, greenyellow)">
    </body>
    
    <body> 
        <center>
            <img width="700" height="250" src="Foto/logo_cipa.png"/>
        <h2>Digite o número do seu candidato</h2>
         </center>
        
        <table border="" align="center" >
            <tr>
                <td align="center"> <input type="number" id="idCandidato" name="txtNumCandidato" value="Número Candidato" > </td>
                <td align="center"> 
                	<img width="80" height="100"  src="">
                </td>
            </tr>
            <tr>
                <td align="center">
                
                <input class="botao" type="button" value="Confirmar">
                <input class="botao" type="button" value="Corrigir"> 
               	<input class="botao" type="button" value="Branco"> </td>
                
                <td align="center">
                	<input type="name" id="idNomeCandidato">
                </td>
            </tr>
        </table>
        
        <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
        <script>
        	
        $('#idCandidato').blur(function(){
        	
        	$.ajax({
        		
	        	url: 'ServletControl',
				method: 'POST',
	        	data: {
					txtNumCandidato : $('#idCandidato').val(),
				},
				success: function(response) {
		        	var response = response;
					alert(response);
					$('idNomeCandidato').val(response);
				}
			})
        	
        });
        
        
	        
        </script>
        
    </body>
         
</html>