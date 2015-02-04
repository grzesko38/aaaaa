package pl.arczynskiadam.web.data;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import org.springframework.data.domain.Page;

import pl.arczynskiadam.core.model.NoteVO;

public class NotesPagesData {
	{
		selectedNotesIds = new HashSet<Integer>();
		maxLinkedPages = 5;
	}
	
	private Page<NoteVO> page;
	private Set<Integer> selectedNotesIds;
	private Date fromDate;
	private int maxLinkedPages;
	
	public NotesPagesData() { }
	public NotesPagesData(int maxLinkedPages) {
		this.maxLinkedPages = maxLinkedPages;
	}
	
	public String getSortCol() {
		return page.getSort().iterator().next().getProperty();
	}
	
	public boolean isSortAscending() {
		return page.getSort().getOrderFor(getSortCol()).isAscending();
	}
	
	public int getFirstLinkedPage() {
  		return Math.max(0, page.getNumber() - (maxLinkedPages / 2));
	}
	
	public int getLastLinkedPage() {
		return Math.min(getFirstLinkedPage() + maxLinkedPages - 1, page.getTotalPages() - 1);
	}
	
	public Page<NoteVO> getPage() {
		return page;
	}
	public void setPage(Page<NoteVO> page) {
		this.page = page;
	}
	public Set<Integer> getSelectedNotesIds() {
		return selectedNotesIds;
	}
	public void setSelectedNotesIds(Set<Integer> selectedNotesIds) {
		this.selectedNotesIds = selectedNotesIds;
	}
	public Date getFromDate() {
		return fromDate;
	}
	public void setFromDate(Date fromDate) {
		this.fromDate = fromDate;
	}
	public int getMaxLinkedPages() {
		return maxLinkedPages;
	}
	public void setMaxLinkedPages(int linkedPages) {
		this.maxLinkedPages = linkedPages;
	}
}