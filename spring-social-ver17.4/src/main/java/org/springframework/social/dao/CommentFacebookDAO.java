package org.springframework.social.dao;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityNotFoundException;
import javax.persistence.EntityTransaction;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.social.model.*;



/**
 * DAO class for Account entity. This class contains all methods that
 * inserts/updates/deletes CommentFacebook info
 * 
 * @author Anh Minh Nguyen
 *
 */
@Repository("CommentFacebookDAO")
@Transactional(propagation = Propagation.REQUIRED)
public class CommentFacebookDAO {
	@PersistenceContext
	public EntityManager entityManager;

	@Transactional

	public CommentFacebook getCommentFacebook(int id) {
		CommentFacebook CommentFacebook = null;
		try {
			CommentFacebook = entityManager.find(CommentFacebook.class, id);
			if (CommentFacebook == null) {
				throw new EntityNotFoundException("Can't find CommentFacebook for ID "
						+ id);
			}
			System.out.println(CommentFacebook.toString() + "getCommentFacebook-DAO");
		} catch (Exception e) {
			System.out.println("\nGetting CommentFacebook had Errors" + "*_"
					+ e.getMessage() + "*_");

		}
		return CommentFacebook;

	}


	public CommentFacebook getCommentFacebookbyCommentFacebookName(String CommentFacebookname) {
		CommentFacebook CommentFacebook = null;
		try {
			TypedQuery<CommentFacebook> query = entityManager.createQuery("SELECT c FROM "
					+ CommentFacebook.class.getName() + " c where c.CommentFacebookName=:CommentFacebookname",
					CommentFacebook.class);
			query.setParameter("CommentFacebookname", CommentFacebookname);
			CommentFacebook = query.getSingleResult();
			if (CommentFacebook == null) {
				throw new EntityNotFoundException(
						"Can't find CommentFacebook for CommentFacebookName " + CommentFacebookname);
			}
			System.out.println(CommentFacebook.toString() + "getCommentFacebook-DAO");
		} catch (Exception e) {
			System.out.println("\nGetting CommentFacebook had Errors" + "*_"
					+ e.getMessage() + "*_");

		}
		return CommentFacebook;

	}

	public List<CommentFacebook> getAllCommentFacebook() {
		List<CommentFacebook> list = new ArrayList<CommentFacebook>();
		try {
			TypedQuery<CommentFacebook> query = entityManager.createQuery("SELECT c FROM "
					+ CommentFacebook.class.getName() + " c", CommentFacebook.class);

			list = query.getResultList();
			System.out.println("Get All CommentFacebooks");
		} catch (Exception e) {
			System.out.println("\nGet Error " + "*_" + e.getMessage() + "*_");

		}
		return list;

	}

	@Transactional

	public boolean createCommentFacebook(CommentFacebook CommentFacebook) {
		boolean check = false;

		try {

			// Insert a row to CommentFacebook table
			entityManager.persist(CommentFacebook);
			check = true;

		} catch (Exception e) {
			System.out.println("\nGet Error with Create CommentFacebook " + "*_"
					+ e.getMessage() + "*_");

		}
		return check;
	}

	/**
	 * Update CommentFacebook information.
	 *
	 * @param CommentFacebook
	 *            an CommentFacebook to be updated.
	 */
	@Transactional

	public boolean updateCommentFacebook(CommentFacebook CommentFacebook) {

		boolean check = false;
		try {
			entityManager.merge(CommentFacebook);
			check = true;
			System.out.println("CommentFacebook " + CommentFacebook.getMessage()+ "updated");
		} catch (Exception e) {
			System.out.println("\nUpdate CommentFacebook get Error " + "*_"
					+ e.getMessage() + "*_");

		}
		return check;
	}

	/**
	 * Delete CommentFacebook by their Id.
	 *
	 * @param CommentFacebookId
	 *            the CommentFacebook Id.
	 */
	@Transactional

	public boolean deleteCommentFacebookById(int CommentFacebookId) {
		boolean check = false;
		try {
			CommentFacebook CommentFacebook = entityManager.find(CommentFacebook.class, CommentFacebookId);
			if (CommentFacebook == null) {
				check = false;
				throw new EntityNotFoundException("Can't find CommentFacebook for ID "
						+ CommentFacebookId);
			}
			System.out.println(CommentFacebook.toString());
			if (CommentFacebook != null) {

				entityManager.remove(CommentFacebook);
				check = true;
				System.out.println("delete CommentFacebook by ID");
			}
		} catch (Exception e) {

			System.out.println("\nDelete CommentFacebook by ID get Error " + "*_"
					+ e.getMessage() + "*_");

		}
		return check;
	}

	/**
	 * Delete CommentFacebook entity.
	 *
	 * @param CommentFacebook
	 *            the object to be deleted.
	 */
	public boolean deleteCommentFacebook(CommentFacebook CommentFacebook) {
		boolean check = false;
		try {
			entityManager.remove(CommentFacebook);
			check = true;
			System.out.println("delete CommentFacebook by CommentFacebook");
		} catch (Exception e) {
			System.out.println("\nDelete CommentFacebook get Error" + "*_"
					+ e.getMessage() + "*_");

		}
		return check;
	}
	
	
	/**
	 * check exist of id_comment
	 * @param id_comment
	 * @return
	 */
	public boolean isExistIdComment(String id_comment)
	{
		CommentFacebook commentFacebook = null;
		try {
			
			TypedQuery<CommentFacebook> query = entityManager.createQuery("SELECT c FROM "
					+ CommentFacebook.class.getName() + " c where c.id_comment=:id_comment",
					CommentFacebook.class);
			query.setParameter("id_comment", id_comment);
			commentFacebook = query.getSingleResult();
			
		} catch (Exception e) {
			
			return false;
		}
		
		if(commentFacebook==null){
			return false;
		}
		else
		{
			return true;
		}
	}
	
	@Transactional
	public boolean updateLikeCountOfCommentFacebook(CommentFacebook commentFacebook) {

		boolean check = false;
		try {
			CommentFacebook commentFacebookUpdate= entityManager.find(CommentFacebook.class, commentFacebook.getId());
			commentFacebookUpdate.setLike_count(commentFacebook.getLike_count());
			check = true;
			System.out.println("CommentFacebook " + commentFacebook.getMessage()+ "updated");
		} catch (Exception e) {
			System.out.println("\nUpdate CommentFacebook get Error " + "*_"
					+ e.getMessage() + "*_");

		}
		return check;
	}
	
	public CommentFacebook getCommentFacebookbyIdPost(String id_comment) {
		CommentFacebook CommentFacebook = null;
		try {
			TypedQuery<CommentFacebook> query = entityManager.createQuery("SELECT c FROM "
					+ CommentFacebook.class.getName() + " c where c.id_comment=:id_comment",
					CommentFacebook.class);
			query.setParameter("id_comment", id_comment);
			CommentFacebook = query.getSingleResult();
			if (CommentFacebook == null) {
				throw new EntityNotFoundException(
						"Can't find CommentFacebook for CommentFacebookName " + id_comment);
			}
			System.out.println(CommentFacebook.toString() + "getCommentFacebook-DAO");
		} catch (Exception e) {
			System.out.println("\nGetting CommentFacebook had Errors" + "*_"
					+ e.getMessage() + "*_");

		}
		return CommentFacebook;

	}
}
