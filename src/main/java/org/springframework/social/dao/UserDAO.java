package org.springframework.social.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityNotFoundException;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.springframework.social.model.BigGroupFace;
import org.springframework.social.model.User;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Repository("userDAO")
@Transactional(propagation = Propagation.REQUIRED)
public class UserDAO {
	@PersistenceContext
	public EntityManager entityManager;

	public List<User> getAllUser() {
		List<User> list = new ArrayList<User>();
		try {
			TypedQuery<User> query = entityManager.createQuery(
					"SELECT c FROM " + User.class.getName() + " c",
					User.class);

			list = query.getResultList();
			System.out.println("Get All User");
		} catch (Exception e) {
			System.out.println("\nGet Error " + "*_" + e.getMessage() + "*_");

		}
		return list;

	}

	@Transactional
	public boolean createUser(User User) {
		boolean check = false;

		try {

			// Insert a row to User table
			entityManager.persist(User);
			check = true;

		} catch (Exception e) {
			System.out.println("\nGet Error with Create User " + "*_"
					+ e.getMessage() + "*_");

		}
		return check;
	}

	@Transactional
	public boolean updateUser(User User) {

		boolean check = false;
		try {
			entityManager.merge(User);
			check = true;
		} catch (Exception e) {
			System.out.println("\nUpdate User get Error " + "*_"
					+ e.getMessage() + "*_");

		}
		return check;
	}

	@Transactional
	public boolean deleteUserId(int id) {
		boolean check = false;
		try {
			User User = entityManager.find(User.class,
					id);
			if (User == null) {
				check = false;
				throw new EntityNotFoundException(
						"Can't find User for ID " + id);
			}
			if (User != null) {

				entityManager.remove(User);
				check = true;
				System.out.println("delete User by ID");
			}
		} catch (Exception e) {

			System.out.println("\nDelete User by ID get Error " + "*_"
					+ e.getMessage() + "*_");

		}
		return check;
	}
	
	@Transactional
	public User getUserById(int id) {
		User User=null;
		try {
			User = entityManager.find(User.class,id);
			
		} catch (Exception e) {

			System.out.println("\nDelete User by ID get Error " + "*_"
					+ e.getMessage() + "*_");

		}
		return User;
	}
	
	@Transactional
	public User getUserByUserId(String clientId) {
		User user= null;
		try {
			TypedQuery<User> query = entityManager.createQuery("SELECT c FROM "
					+ User.class.getName() + " c where c.userId=:userId",
					User.class);
			query.setParameter("userId", clientId);
			user= query.getSingleResult();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;
	}
	
	//Minh add 2:20 AM date 10/06/2015
		/**
		 * check userID from facebook already exist ????
		 * @param userId
		 * @return boolean
		 */
		public boolean isExistUserId(String userId) {
			User user= null;
			try {
				TypedQuery<User> query = entityManager.createQuery("SELECT c FROM "
						+ User.class.getName() + " c where c.userId=:userId",
						User.class);
				query.setParameter("userId", userId);
				user= query.getSingleResult();
			} catch (Exception e) {
				e.printStackTrace();
				return false;
			}
			if(user==null){
				return false;
			}
			else{
				return true;
			}
		}
	
}
