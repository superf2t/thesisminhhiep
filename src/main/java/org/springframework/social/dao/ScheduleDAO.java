package org.springframework.social.dao;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityNotFoundException;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.springframework.social.model.BigGroupFace;
import org.springframework.social.model.Schedule;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Repository("scheduleDAO")
@Transactional(propagation = Propagation.REQUIRED)
public class ScheduleDAO {
	@PersistenceContext
	public EntityManager entityManager;

	public List<Schedule> getAllSchedule() {
		List<Schedule> list = new ArrayList<Schedule>();
		try {
			TypedQuery<Schedule> query = entityManager.createQuery(
					"SELECT c FROM " + Schedule.class.getName() + " c",
					Schedule.class);

			list = query.getResultList();
			System.out.println("Get All Schedule");
		} catch (Exception e) {
			System.out.println("\nGet Error " + "*_" + e.getMessage() + "*_");

		}
		return list;

	}

	@Transactional
	public boolean createSchedule(Schedule Schedule) {
		boolean check = false;

		try {

			// Insert a row to Schedule table
			entityManager.persist(Schedule);
			check = true;

		} catch (Exception e) {
			System.out.println("\nGet Error with Create Schedule " + "*_"
					+ e.getMessage() + "*_");

		}
		return check;
	}

	public boolean isExistMessageAndDatePost(String clientId, String message,
			String datePost) {

		Schedule schedule = null;
		try {
			TypedQuery<Schedule> query = entityManager
					.createQuery(
							"SELECT c FROM "
									+ Schedule.class.getName()
									+ " c where c.clientId=:clientId and c.groupMessage=:groupMessage and c.datePost=:datePost",
							Schedule.class);
			query.setParameter("clientId", clientId);
			query.setParameter("groupMessage", message);
			query.setParameter("datePost", datePost);
			schedule = query.getSingleResult();
		} catch (Exception e) {

		}
		if (schedule == null) {
			return false;
		} else {
			return true;
		}
	}

	public List<Schedule> getAllScheduleOfClient(String clientId) {
		List<Schedule> list = new ArrayList<Schedule>();
		try {
			TypedQuery<Schedule> query = entityManager.createQuery(
					"SELECT c FROM " + Schedule.class.getName()
							+ " c where c.clientId=:clientId", Schedule.class);
			query.setParameter("clientId", clientId);
			list = query.getResultList();
		} catch (Exception e) {
			System.out.println("\nGetting Schedule had Errors" + "*_"
					+ e.getMessage() + "*_");

		}
		return list;
	}

	public Schedule getScheduleOfClientWithMessageAndDatePost(String clientId,
			String groupMessage, String datePost) {
		Schedule schedule = null;
		try {
			TypedQuery<Schedule> query = entityManager
					.createQuery(
							"SELECT c FROM "
									+ Schedule.class.getName()
									+ " c where c.clientId=:clientId and c.groupMessage=:groupMessage and c.datePost=:datePost",
							Schedule.class);
			query.setParameter("clientId", clientId);
			query.setParameter("groupMessage", groupMessage);
			query.setParameter("datePost", datePost);
			schedule = query.getSingleResult();
		} catch (Exception e) {
			System.out.println("\nGetting Schedule had Errors" + "*_"
					+ e.getMessage() + "*_");

		}
		return schedule;
	}

	@Transactional
	public boolean updateSchedule(Schedule schedule) {

		boolean check = false;
		try {
			entityManager.merge(schedule);
			check = true;
		} catch (Exception e) {
			System.out.println("\nUpdate Schedule get Error " + "*_"
					+ e.getMessage() + "*_");

		}
		return check;
	}

	@Transactional
	public boolean deleteScheduleId(int id) {
		boolean check = false;
		try {
			Schedule schedule = entityManager.find(Schedule.class,
					id);
			if (schedule == null) {
				check = false;
				throw new EntityNotFoundException(
						"Can't find Schedule for ID " + id);
			}
			if (schedule != null) {

				entityManager.remove(schedule);
				check = true;
				System.out.println("delete schedule by ID");
			}
		} catch (Exception e) {

			System.out.println("\nDelete schedule by ID get Error " + "*_"
					+ e.getMessage() + "*_");

		}
		return check;
	}
	
	@Transactional
	public Schedule getScheduleById(int id) {
		Schedule schedule=null;
		try {
			schedule = entityManager.find(Schedule.class,id);
			
		} catch (Exception e) {

			System.out.println("\nDelete schedule by ID get Error " + "*_"
					+ e.getMessage() + "*_");

		}
		return schedule;
	}
	
	
	
}
