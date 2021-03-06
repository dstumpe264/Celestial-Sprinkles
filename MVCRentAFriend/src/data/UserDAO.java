package data;

import java.util.List;

import entities.Event;
import entities.Profile;
import entities.Review;
import entities.User;

public interface UserDAO {
	public User updateUser(int id, User user);
	public boolean destroyUserById(int id);
	public User getUserById(int id);
	public List<User> getAllUsers();
	public List<User> getAllUsersByEvent(int eventId);
	public User getUserByUserName(String username);
	
	public Profile updateProfile(int id, Profile profile);
	public Profile getProfileById(int id);
	//public List<Profile> getProfileByKey(String keyword);
	Profile getProfileByUserId(int id);
	boolean deleteEventFromUser(int uid, int eid);
	boolean createUser(String username, String password, String firstName, String lastName, String bio,
			String imageUrl, String facebookUrl, String linkedinUrl);
	boolean addReview(int uid, String comment, int rating);
	List<Review> getReviewsByUser(int uid);
}
