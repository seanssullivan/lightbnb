INSERT INTO users (id, name, email, password)
VALUES (1, 'John Boddy', 'mr_boddy@example.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'),
(2, 'Blanche White', 'nurse_white@example.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'),
(3, 'Jonathan Green', 'reverand_green@example.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'),
(4, 'Elizabeth Peacock', 'mrs_peacock@example.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'),
(5, 'Peter Plum', 'professor_plum@example.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'),
(6, 'Vivienne Scarlett', 'miss_scarlett@example.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'),
(7, 'Michael Mustard', 'colonel_mustard@example.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'),
(8, 'Agatha Havisham', 'auntie_agatha@example.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'),
(9, 'Cyrano de Beauregard', 'powerful_panache@example.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'),
(10, 'Samuel Smothers', 'modern_butler@example.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'),
(11, 'Debra Dusty', 'cinderella_complex@example.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'),
(12, 'Charity Chase', 'the_good_doctor@example.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'),
(13, 'Lulu Lacroix', 'dishing_the_dirt@example.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'),
(14, 'Presley Parker', 'peddle_to_the_metal@example.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'),
(15, 'Clay Carlson', 'tennis_shorts@example.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'),
(16, 'Spritzy Sparks', 'hairspray_haze@example.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'),
(17, 'Pierre Lemaire', 'cooking_for_profit@example.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'),
(18, 'Astra Aurora', 'in_the_stars@example.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'),
(19, 'Hickory Gardner', 'snakeroot@example.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'),
(20, 'Annie Wilkes', 'superfan@example.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.');

INSERT INTO properties (id, owner_id, title, description, thumbnail_photo_url, cover_photo_url, cost_per_night, parking_spaces, number_of_bathrooms, number_of_bedrooms, street, city, province, country, post_code, active)
VALUES (1, 1, 'Tudor Mansion', 'This idellic English country house is the perfect place to host gigantic dinner parties.', 'https://images.pexels.com/photos/87378/pexels-photo-87378.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=350', 'https://images.pexels.com/photos/87378/pexels-photo-87378.jpeg', 100, 8, 3, 8, '1 Tudor Close', '', 'Hampshire', 'England', 'BH23 3ND', true),
(2, 8, 'End House', 'A beautiful gothic mansion with lavish rooms and a stunning chandelier.', 'https://images.pexels.com/photos/112291/pexels-photo-112291.jpeg?auto=compress&cs=tinysrgb&dpr=2&h350', 'https://images.pexels.com/photos/112291/pexels-photo-112291.jpeg', 350, 20, 7, 13, '13 Dead End Drive', '', 'West Virginia', 'United States', '26333', true),
(3, 20, 'Cabin in the Woods', 'A charming cabin miles away from civilization and surrounded by prestine woodland', 'https://images.pexels.com/photos/206648/pexels-photo-206648.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=350', 'https://images.pexels.com/photos/206648/pexels-photo-206648.jpeg', 10, 1, 1, 2, 'Lot 1 Lonely Lane', '', 'Colorado', 'United States', '80000', true);

INSERT INTO reservations (id, guest_id, property_id, start_date, end_date)
VALUES (1, 1, 3, '2020-03-13', '2020-03-15'),
(2, 2, 1, '2020-03-20', '2020-02-22'),
(3, 3, 1, '2020-03-20', '2020-02-22'),
(4, 4, 1, '2020-03-20', '2020-02-22'),
(5, 5, 1, '2020-03-20', '2020-02-22'),
(6, 6, 1, '2020-03-20', '2020-02-22'),
(7, 7, 1, '2020-03-20', '2020-02-22'),
(8, 8, 3, '2020-04-10', '2020-04-17'),
(9, 9, 2, '2020-04-17', '2020-04-19'),
(10, 10, 2, '2020-04-17', '2020-04-19'),
(11, 11, 2, '2020-04-17', '2020-04-19'),
(12, 12, 2, '2020-04-17', '2020-04-19'),
(13, 13, 2, '2020-04-17', '2020-04-19'),
(14, 14, 2, '2020-04-17', '2020-04-19'),
(15, 15, 2, '2020-04-17', '2020-04-19'),
(16, 16, 2, '2020-04-17', '2020-04-19'),
(17, 17, 2, '2020-04-17', '2020-04-19'),
(18, 18, 2, '2020-04-17', '2020-04-19'),
(19, 19, 2, '2020-04-17', '2020-04-19'),
(20, 20, 2, '2020-04-17', '2020-04-19');

INSERT INTO property_reviews (id, guest_id, property_id, reservation_id, rating, message)
VALUES (1, 1, 3, 1, 1, 'No heating, bed bugs everywhere and, worst of all, no cell service.'),
(2, 4, 1, 4, 5, 'Gorgeous building! I would kill to own a place like this!'),
(3, 6, 1, 6, 3, 'Kind of creepy...'),
(4, 7, 1, 7, 2, 'Absolutely disgusting! Dust everywhere! I could have killed a maid if I found one. Chocolate on the pillow was a nice touch, though.'),
(5, 5, 1, 5, 4, 'Fantastic library. -1 star for poor lighting. Had to read by candlelight.'),
(6, 2, 1, 2, 3, 'Old mansion was cool, but strangest thing... found a piece of plumbing laying on the floor. '),
(7, 11, 2, 11, 1, 'For such a huge mansion, the decor was incredibly cheap. Pretty sure the silverware is not real silver...'),
(8, 12, 2, 12, 2, 'I was nearly crushed by a falling chandelier! Honestly, the upkeep on this place is terrible.'),
(9, 18, 2, 18, 5, 'This place has a really great aura. And the ghosts were very pleasant to talk to.');