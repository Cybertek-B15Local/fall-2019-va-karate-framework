package com.app.utils;

import com.github.javafaker.Book;
import com.github.javafaker.Faker;

import java.util.HashMap;
import java.util.Map;

public class LibraryDataGenerator {
    /**
     * take user type and create map that contains a student or librarian user data
     *
     * @param userGroup
     * @return user map
     */
    public static Map<String, Object> createUser(int userGroup) {
        Faker faker = new Faker();
        String fullName = faker.name().fullName();
        String usernameEmail = faker.name().username();
        String companyUrl = faker.company().url().substring(4);
        String email = usernameEmail + "@" + companyUrl;
        String address = faker.address().fullAddress();
        Map<String, Object> user = new HashMap<>();
        user.put("full_name", fullName);
        user.put("email", email);
        user.put("password", faker.number().digits(5));
        user.put("user_group_id", userGroup);
        user.put("status", "active");
        user.put("start_date", "2020-05-05");
        user.put("end_date", "2021-05-05");
        user.put("address", address);
        return user;
    }

    /**
     * take user type and create a map that contains a book data
     *
     * @return book map
     */
    public static Map<String, Object> createBook() {
        Faker faker = new Faker();
        Book bookInfo = faker.book();
        Map<String, Object> book = new HashMap<>();
        book.put("name", bookInfo.title());
        book.put("author", bookInfo.author());
        book.put("isbn", faker.number().digits(13));
        book.put("year", faker.number().numberBetween(1900, 2020));
        book.put("book_category_id", faker.number().numberBetween(1, 20));
        book.put("description", bookInfo.publisher());
        return book;
    }

    public static void main(String[] args) {
        System.out.println(createBook());
        System.out.println(createUser(3));
    }

}
