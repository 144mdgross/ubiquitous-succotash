# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
peter = User.create(name: "Peter", email: "peter@example.com")
tori = User.create(name: "Tori", email: "tori@example.com")
chad = User.create(name: "Chad", email: "chad@example.com")

# Subjects and versions
math = Subject.create(title: "Math")
biology = Subject.create(title: "Biology")
sociology = Subject.create(title: "Sociology")

math_v1 = Version.create(subject: math)
math_v2 = Version.create(subject: math)

biology_v1 = Version.create(subject: biology)
biology_v2 = Version.create(subject: biology)

sociology_v1 = Version.create(subject: sociology)
sociology_v2 = Version.create(subject: sociology)
sociology_v3 = Version.create(subject: sociology)

# Users versions
VersionUser.create(user: peter, version: math_v2)
VersionUser.create(user: peter, version: biology_v1)
VersionUser.create(user: peter, version: sociology_v1)

VersionUser.create(user: tori, version: math_v1)
VersionUser.create(user: tori, version: biology_v2)
VersionUser.create(user: tori, version: sociology_v2)

VersionUser.create(user: chad, version: math_v2)
VersionUser.create(user: chad, version: biology_v2)
VersionUser.create(user: chad, version: sociology_v3)

# Math lessons and questions
# v1
math_lesson_v1_1 = Lesson.create(version: math_v1, content: "Count to twenty twice")
math_question_v1_l1 = Question.create(lesson: math_lesson_v1_1, uid: "abc", question: "Start from one, go to twenty, twice", correct_answer: "1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20")
# peter(mathv2) OLD answer
Answer.create(user: peter, question: math_question_v1_l1, created_at: 1.day.ago, answer: "1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19")
# tori(mathv1) answer
Answer.create(user: tori, question: math_question_v1_l1, answer: "1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20")
# chad(mathv2) answer
Answer.create(user: chad, question: math_question_v1_l1, answer: "2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20")

math_lesson_v1_2 = Lesson.create(version: math_v1, content: "Find the shirt that does not have stripes")
math_question_v1_l2 = Question.create(lesson: math_lesson_v1_2,uid: "xyz", question: "It is impossible", correct_answer: nil)
# tori(mathv1) answer
Answer.create(user: tori, question: math_question_v1_l2, answer: "nul")
# chad(mathv2) OLD answer
Answer.create(user: chad, created_at: 1.day.ago, question: math_question_v1_l2, answer: "nil")
# chad(mathv2) answer
Answer.create(user: chad, question: math_question_v1_l2, answer: "null")

# v2
math_lesson_v2_1 = Lesson.create(version: math_v2, content: "Count to twenty twice, then read it carefully again")
math_question_v2_l1 = Question.create(lesson: math_lesson_v2_1, uid: "abc", question: "Start from one, go to twenty, twice", correct_answer: "1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20")
# peter(mathv2) answer
Answer.create(user: peter, question: math_question_v2_l1, answer: "1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20")

math_lesson_v2_2 = Lesson.create(version: math_v2, content: "Find the shirt that does not have stripes")
math_question_v2_l2 = Question.create(lesson: math_lesson_v2_2, uid: "xyz",  question: "Handling the context of the negative is hard", correct_answer: nil)
# peter(mathv2) answer
Answer.create(user: peter, question: math_question_v2_l2 , answer: "false")

# Biology lessons
# v1
biology_lesson_v1_1 = Lesson.create(version: biology_v1, content: "Frog Parts: You Gotta Know Them")
biology_question_v1_l1 = Question.create(lesson: biology_lesson_v1_1, uid: "123", question: "The clear eye membrane", correct_answer: "Nictitating Membrane")
Answer.create(user: peter, question: biology_question_v1_l1, created_at: 1.day.ago, answer: "nicktater")
Answer.create(user: peter, question: biology_question_v1_l1, answer: "nicitatier")
Answer.create(user: tori, question: biology_question_v1_l1, answer: "nickbrane")
biology_question_v1_l1_2 = Question.create(lesson: biology_lesson_v1_1, uid: "456", question: "For holding prey", correct_answer: "Vomerine Teeth")
Answer.create(user: peter, question: biology_question_v1_l1_2, answer: "volmers")
Answer.create(user: tori, question: biology_question_v1_l1_2, created_at: 1.day.ago, answer: "v-teeth")

biology_lesson_v1_2 = Lesson.create(version: biology_v1, content: "Interleukin 4 interceptors effects on cytokine storms")

# v2
biology_lesson_v2_1 = Lesson.create(version: biology_v2, content: "Frog Parts: You're better off knowing them")
biology_question_v2_l1 = Question.create(lesson: biology_lesson_v2_1, uid: "123", question: "The clear eye membrane", correct_answer: "Nictitating Membrane")
Answer.create(user: chad, question: biology_question_v2_l1, answer: "nictitating membrane")

biology_question_v2_l1_2 = Question.create(lesson: biology_lesson_v2_1, uid: "456", question: "For holding prey, roof of mouth", correct_answer: "Vomerine Teeth")
Answer.create(user: chad, question: biology_question_v2_l1_2, answer: "Vomerine Teeth")
Answer.create(user: tori, question: biology_question_v2_l1_2, answer: "Vowelmerine")

biology_question_v2_l1_3 = Question.create(lesson: biology_lesson_v2_1, uid: "789", question: "For holding prey, edge of mouth", correct_answer: "Maxillary Teeth")
Answer.create(user: tori, question: biology_question_v2_l1_3, answer: "Vowelmerine")

biology_lesson_v2_2 = Lesson.create(version: biology_v2, content: "Interleukin 4 interceptors: Stop Immunoglobin E")
biology_question_v2_l2 = Question.create(lesson: biology_lesson_v2_2, uid: "hcl", question: "Describe T Cell Reduction", correct_answer: nil)
Answer.create(user: tori, question: biology_question_v2_l2, answer: "It works on the membrane of cells by altering cytokine expressions")
Answer.create(user: peter, question: biology_question_v2_l2, answer: "I'm not even on this version anymore")

# Sociology lessons
# v1
sociology_lesson_v1_1 = Lesson.create(version: sociology_v1, content: "Society and Connection")
sociology_question_v1_l1 = Question.create(lesson: sociology_lesson_v1_1, uid: "hcl", question: "What programming language was Hammurabi's Code written in?", correct_answer: "Assembly")
Answer.create(user: peter, question: sociology_question_v1_l1, answer: "Assembly")
Answer.create(user: tori, question: sociology_question_v1_l1, answer: "Assembly")
Answer.create(user: chad, question: sociology_question_v1_l1, answer: "Assembly")
# v2
sociology_lesson_v2_1 = Lesson.create(version: sociology_v2, content: "Society and Connection, Power and Control")
sociology_question_v2_l1 = Question.create(lesson: sociology_lesson_v2_1, uid: "hcl", question: "What programming language was Hammurabi's Code written in?", correct_answer: "C")
Answer.create(user: peter, question: sociology_question_v2_l1, created_at: 1.day.ago, answer: "C")
Answer.create(user: tori, question: sociology_question_v2_l1, created_at: 1.day.ago, answer: "C")
Answer.create(user: chad, question: sociology_question_v2_l1, created_at: 1.day.ago, answer: "C")
# v3
sociology_lesson_v3_1 = Lesson.create(version: sociology_v3, content: "Living Together")
sociology_question_v3_l1 = Question.create(lesson: sociology_lesson_v3_1, uid: "pwo", question: "Which language damages metal?", correct_answer: "Rust")
Answer.create(user: chad, question: sociology_question_v3_l1, answer: "Rust")

