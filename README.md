# Galvanize Take Home Work

* Ruby version - 2.6.0
* Rails version - 5.2.1

Versions are not necessarily required to match.

* Database initialization

We'll be using a postgres database called `curriculum_dev` that is configured in the `config/database.yml` file.

Run `createdb curriculum_dev` from your cli or `CREATE DATABASE curriculum_dev;` in the psql interpreter to create the database

Use `bundle` to install dependencies.

Ensure rails is installed with `gem install rails`, then run `rails db:migrate` to create the data tables. Run `rails db:seed` to create example seed data.

## Database Schema

The database represents publishable content for a hypothetical learning management system. 

The `users` table holds users in the system, including students and instructors.

The `subjects` table holds the teachable subjects in the database, such as "computer science" or "biology".

The `versions` table represents a published release of curriculum content for a subject, allowing curriculum developers to iterate or experiment with curriculum. There is a `subject_id` on this table. Think of a version like a commit sha for a deployed application- instructors can depoy a version of a subject to individual students, custom tailoring content to the student's needs.

The `version_users` table allows students to be assigned versions of curriculum for each subject.

The `lessons` table holds lessons for a given subject. Lessons have a `version_id`, and many lessons exist for a given version of a subject.

The `questions` table has a `lesson_id` and holds questions for individual lessons. The students submit answers to questions. In order to keep track of questions which are the same across versions, questions have a `uid` attribute which identifies the question as the same across different versions of lessons. This means that when a student submits an answer to a question on version 1 with a uid of `xyz`, that answer still counts for the same question on version 2 that _also_ has a uid of `xyz`.

The `answers` table has a `user_id` and `question_id` along an answer a student has submitted to a question.

## Objective

Create a JSON endpoint that captures everything we'll need to show a lesson and it's questions to a student. The student's latest answer for each question should 

#### Acceptance Criteria

1. The endpoint should specify a lesson and user id.

2. If the lesson belongs to a version that the user has NOT been assigned, then the endpoint should 404.

3. If the lesson belongs to a version that has been assigned to the user, yield the lesson `contents` attribute.

4. If lesson contents are yielded, also include a `questions` attribute that is an array of each question in the lesson. Do NOT yield the `correct_answer` attribute of the question, but do include its `uid` and the `question`.

5. For each question, include the user's latest answer to that question. The student's answer should be `nil` if the student has not submitted an answer to that question.

Use the latest submission by question uid; even if the version the student has been assigned is different from the one which they submitted, it should be present if the question's `uid` is the same across versions.
