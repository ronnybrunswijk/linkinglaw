$(document).on 'ready page:load', ->
	$('li.selected').removeClass()
	pageId = $('#pageId').val()
	$('#' + pageId).parent('li').addClass('selected')
