# 📘 PostgreSQL 

---

## 🧠 What is PostgreSQL?

**PostgreSQL** একটি শক্তিশালী, ওপেন-সোর্স **object-relational database management system (ORDBMS)**। এটি SQL ভাষাকে উন্নত করে অতিরিক্ত অনেক ফিচার যোগ করেছে যেমন:

- Complex queries  
- Foreign keys  
- Triggers  
- Updatable views  
- Transactions  
- Multiversion Concurrency Control (MVCC)

এটি নির্ভরযোগ্যতা, ফিচারের সমৃদ্ধতা এবং পারফরম্যান্সের জন্য বিখ্যাত, বিশেষ করে **data warehousing**, **web applications** এবং **analytics systems** এর জন্য উপযুক্ত।

---

## 🧠 PostgreSQL-এ স্কিমা (Schema) এর উদ্দেশ্য

একটি **schema** হচ্ছে একটি namespace যা বিভিন্ন **database objects** (যেমন table, view, index, function ইত্যাদি) ধারণ করে।

**উদ্দেশ্যঃ**
- **Organization:** সম্পর্কিত object গুলো একত্রে রাখতে সাহায্য করে।
- **Access Control:** প্রতিটি স্কিমায় আলাদা করে পারমিশন সেট করা যায়।
- **Name Conflict Avoidance:** এক নামের object বিভিন্ন স্কিমায় থাকতে পারে।

**উদাহরণ:**
```sql
CREATE SCHEMA wildlife;
CREATE TABLE wildlife.animals (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100)
);
```

---

## 🔑 Primary Key এবং Foreign Key এর ব্যাখ্যা

### Primary Key

একটি **primary key** একটি টেবিলের প্রতিটি রেকর্ডকে ইউনিকভাবে চিহ্নিত করে। এটি ইউনিক মান রাখে এবং কখনো NULL হয় না।

```sql
CREATE TABLE students (
  student_id SERIAL PRIMARY KEY,
  name VARCHAR(100)
);
```

### Foreign Key

**Foreign key** একটি টেবিলের সাথে আরেকটি টেবিলের সম্পর্ক তৈরি করে। এটি নিশ্চিত করে যে একটি টেবিলের নির্দিষ্ট মান অন্য টেবিলেও থাকতে হবে — এটাকে **referential integrity** বলা হয়।

```sql
CREATE TABLE enrollments (
  enrollment_id SERIAL PRIMARY KEY,
  student_id INT REFERENCES students(student_id),
  course_name VARCHAR(100)
);
```

---

## 🗂️ GROUP BY Clause এবং Aggregation এ এর ভূমিকা

**GROUP BY** ক্লজটি একটি নির্দিষ্ট কলামের উপর ভিত্তি করে রেকর্ডগুলোকে গ্রুপ করে। এটি সাধারণত **aggregate functions** (যেমন COUNT, SUM, AVG) এর সাথে ব্যবহৃত হয়।

```sql
SELECT department, COUNT(*) AS employee_count
FROM employees
GROUP BY department;
```

**উপকারিতাঃ**
- ডেটার নির্দিষ্ট অংশের উপর হিসাব করা যায়
- যেমন — প্রতিটি বিভাগে কতজন কর্মী আছে তা জানা যায়

---

## 📊 Aggregate Functions in PostgreSQL

**Aggregate functions** একটি ডেটার সেটের উপর গণনা করে একটি একক ফলাফল দেয়।

### Common Aggregate Functions:

- `COUNT()` → মোট রেকর্ডের সংখ্যা
- `SUM()` → সংখ্যাগুলোর যোগফল
- `AVG()` → গড় হিসাব করে

```sql
SELECT
  COUNT(*) AS total_orders,
  SUM(price) AS total_sales,
  AVG(price) AS average_price
FROM orders;
```

**ব্যবহার:**  
এগুলো **GROUP BY** এর সাথে ব্যবহার করে নির্দিষ্ট গ্রুপের জন্য বিশ্লেষণ করা সহজ হয়। যেমন — প্রতি কাস্টমারের মোট অর্ডার সংখ্যা বা বিক্রির গড়।

---


