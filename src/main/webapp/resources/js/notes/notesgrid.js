NotesGridScripts = {
	// === checkboxes === 
	bindSelectAll: function() {
		$("#selectAll").click(function() {
			$("input[id^='selections']").each(function() {
				this.checked = $("#selectAll").is(':checked');
			});
			NotesGridScripts.postAjaxSelectedIds();
		});
	},
	bindNoteCheckbox: function() {
		$("input[id^='selections']").click(function() {
			NotesGridScripts.updateSelectAllCheckbox();
			NotesGridScripts.postAjaxSelectedIds();
		});
	},
	updateSelectAllCheckbox: function() {
		var allChecked  = true;
		$("input[name='selections']").each(function() {
			if( !this.checked ) {
				allChecked = false;
			}
		});
		$("#selectAll").prop('checked', allChecked);
	},
	postAjaxSelectedIds: function() {
		var params = {
				headers: { 
			        'Accept': 'application/json',
			        'Content-Type': 'application/json' 
			    },
			    type: 'POST',
			    url: '/NotesManager/notesmanager/updateSelections.ajax',
			    data: JSON.stringify({"selections": NotesGridScripts.selectedCheckboxesToArray()}),
			    dataType: 'json',
		};
		$.ajax(params);
	},
	selectedCheckboxesToArray: function() {
		var inputs = $("input[id^='selections']:checked");
	    var arr = [];
	    for (var i = 0; i < inputs.length; i++) {
	        if (inputs[i].checked)
	            arr.push(inputs[i].value);
	    }
	    return arr;
	},
	
	// === entries per page form ===
	bindEntriesPerPage: function() {
		$(".entriesPerPage").each(
			function() {
				$(this).change(function() {
					$(this).parents('form:first').submit();
				})
			}
		);
	},
	
	// === delete buttons ===
	bindDeleteNotes: function() {
		$("#deleteSelectedNotes").click(function() {
			var input = $("<input>").attr("type", "hidden").attr("name", "delete").val("selected");
			$('#notesGridForm').append($(input));
			$("#notesGridForm").submit();
		});
	},
	
	// === all ===
	bindAll: function() {
		NotesGridScripts.bindSelectAll();
		NotesGridScripts.bindNoteCheckbox();
		NotesGridScripts.bindEntriesPerPage();
		NotesGridScripts.bindDeleteNotes();
	}
}

$(document).ready(function() {
	NotesGridScripts.bindAll();
});