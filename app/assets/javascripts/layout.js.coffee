$(document).on 'ready page:load', ->
	$('a.selected').removeClass()
	pageId = $('#pageId').val()
	$('#' + pageId).addClass('selected')

    
