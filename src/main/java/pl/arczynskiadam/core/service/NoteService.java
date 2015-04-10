package pl.arczynskiadam.core.service;

import java.util.Collection;
import java.util.Date;

import org.springframework.data.domain.Page;

import pl.arczynskiadam.core.model.NoteVO;
import pl.arczynskiadam.web.data.NotesPagesData;

public interface NoteService {
	
	public void saveNewNote(NoteVO note);
	public Page<NoteVO> listNotes(int pageId, int pageSize, String sortCol, boolean asc);
	public Page<NoteVO> listNotesFromDate(int pageId, int pageSize, String sortCol, boolean asc, Date date);
	public void deleteNote(int id);
	public void deleteNotes(Collection<Integer> ids);
	public void deleteUserNotes(int userId);
	public NoteVO findNoteById(int id);
	public NotesPagesData retrievePagesDataFromSession();
	public void savePagesDataToSession(NotesPagesData pagesData);
	public void removePaginationDataFromSession();
	public void clearFromDateFilter();
}
