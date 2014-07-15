<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<form id="edit-teacher" action="<c:url value="ai/professeur/edition"/>" method="POST" class="form--horizontal">
    <div class="modal__mod__head">
    	<h3 class="modal__mod__head__title text-center">Edition du professeur n°<c:out value='${ professeur.id }'/></h3>
    </div>
    <div class="modal__mod--sm modal__mod--vertical">
        <input type="hidden" name="id" class="form--control"  size="39" value="<c:out value='${ professeur.id }'/>" size="20" pattern="[0-9]{1,11}" x-moz-error-message="Veuillez entrez un nom correct composer de 3 à 50 caractères" required/>
        <label>PRENOM</label>
        <input type="text" name="firstName" class="form--control"  size="39" value="<c:out value='${ professeur.prenom }'/>" size="20" pattern="[a-zA-Z ]{2,50}" x-moz-error-message="Veuillez entrez un prenom correct composer de 3 à 50 caractères" required/>
        <span class="form__error">${ form.erreurs['firstName'] }</span>
        <label>NOM</label>
        <input type="text" name="lastName" class="form--control"  size="39" value="<c:out value='${ professeur.nom }'/>" size="20" pattern="[a-zA-Z ]{2,50}" x-moz-error-message="Veuillez entrez un nom correct composer de 3 à 50 caractères" required/>
        <span class="form__error">${ form.erreurs['lastName'] }</span>
        <label>ADRESSE MAIL</label>
        <input type="text" name="emailAddress" class="form--control"  size="39" value="<c:out value='${ professeur.adresseMail }'/>" pattern="[a-zA-Z0-9@.-_]+@[a-zA-Z.]{2,20}.[a-zA-Z]{2,3}" x-moz-error-message="Veuillez entrez une adresse mail correcte" required/>
        <span class="form__error">${ form.erreurs['emailAddress'] }</span>
        <label>NOUVEAU MOT DE PASSE</label>
        <input type="password" name="password" class="form--control"  size="39" x-moz-error-message="Veuillez entrez un mot de passe composer de 8 caractères minimum"/>
        <span class="form__error">${ form.erreurs['password'] }</span>
        <label>CONFIRMATION</label>
        <input type="password" name="confirmation" class="form--control"  size="39" x-moz-error-message="Veuillez entrez un mot de passe composer de 8 caractères minimum"/>
        <span class="form__error">${ form.erreurs['password'] }</span>
        <label>GROUPE(S)</label>
        <select multiple="multiple" size="7" name="groups" class="form--control" >
            <option disabled="disabled">Sélectionnez un ou plusieurs groupe(s)</option>
            <c:forEach items="${ listeGroupes }" var="groupe">
                <option value="${ groupe.id }"
                   <c:forEach items="${ professeur.listeGroupes }" var="professeurGroupe">
                       <c:if test="${ professeurGroupe.id == groupe.id }"><c:out value="selected=selected"/></c:if>                                  
                   </c:forEach>
                >
                    <c:out value="${ groupe.nom }"/>
                </option>
            </c:forEach>
        </select>
        <span class="form__error">${ form.erreurs['"groups"'] }</span>
    </div>
    <div class="modal__mod--sm modal__mod--vertical">
        <label>MATIERE(S) ENSEIGNEE(S)</label>
        <select multiple="multiple" size="23" name="matters" class="form--control" >
            <option disabled="disabled">Sélectionnez une ou plusieurs mati7res</option>
            <c:forEach items="${ listeMatieres }" var="matiere">
                <option value="${ matiere.id }"
                   <c:forEach items="${ professeur.listeMatieres }" var="professeurMatiere">
                       <c:if test="${ professeurMatiere.id == matiere.id }"><c:out value="selected=selected"/></c:if>                                
                   </c:forEach>
                >
                   <c:out value="${ matiere.nom }"/>
                </option>
            </c:forEach>
        </select>
        <span class="form__error">${ form.erreurs['matters'] }</span>
        <span class="form__error">${ form.erreurs['professeur'] }</span>
    </div>
    <div class="form__control modal__mod__control">
    	<button type="submit" class="btn btn--primary">ENREGISTRER</button>
        <button type="button" class="btn btn--default" onclick="removeModalWindow()">ANNULER</button>
   	</div>
</form>