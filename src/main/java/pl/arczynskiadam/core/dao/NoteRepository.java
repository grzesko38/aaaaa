package pl.arczynskiadam.core.dao;

import java.util.Collection;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.querydsl.QueryDslPredicateExecutor;
import org.springframework.data.repository.query.Param;

import pl.arczynskiadam.core.model.AnonymousUserVO;
import pl.arczynskiadam.core.model.NoteVO;

public interface NoteRepository extends JpaRepository<NoteVO, Integer>, QueryDslPredicateExecutor<NoteVO>, JpaSpecificationExecutor<NoteVO> {
	
	@Query("FROM NoteVO n WHERE n.author = :author")
    public Page<NoteVO> findAllForUser(@Param("author") AnonymousUserVO author, Pageable pageable);
	
//	@Query("FROM NoteVO n WHERE TYPE(n.author) = AnonymousUserVO")
	@Query("FROM NoteVO n WHERE n.author.email IS NULL")
    public Page<NoteVO> findAllForAnonymous(Pageable pageable);
	
	@Modifying
	@Query("DELETE NoteVO n WHERE n.id IN (:ids)")
    public void deleteByIds(@Param("ids") Collection<Integer> ids);
	
	@Modifying
	@Query("DELETE NoteVO AS n WHERE n.author.id = :id")
    public void deleteByUserId(@Param("id") Integer id);
}
