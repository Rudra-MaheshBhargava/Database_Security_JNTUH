from flask import Flask, render_template_string, request
import mysql.connector

app = Flask(__name__)

# HTML login page
HTML_PAGE = '''
<!DOCTYPE html>
<html>
<head>
    <title>SQL Injection Lab</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background: #f4f4f9;
        }

        .box {
            background: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            width: 300px;
            text-align: center;
        }

        input {
            width: 100%;
            padding: 8px;
            margin: 10px 0;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        button {
            width: 100%;
            padding: 10px;
            background: #4CAF50;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .message {
            margin-top: 15px;
            font-weight: bold;
        }

        .success {
            color: green;
        }

        .error {
            color: red;
        }
    </style>
</head>
<body>
    <div class="box">
        <h2>SQL Injection Lab</h2>

        <form method="POST">
            <input type="text"
                   name="username"
                   placeholder="User ID"
                   required>

            <input type="password"
                   name="password"
                   placeholder="Password"
                   required>

            <button type="submit">Login</button>
        </form>

        {% if message %}
            <div class="message {{ status }}">
                {{ message }}
            </div>
        {% endif %}
    </div>
</body>
</html>
'''


@app.route('/', methods=['GET', 'POST'])
def login():
    message = None
    status = None

    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']

        db = None
        cursor = None

        try:
            # Connect to the local MySQL database
            db = mysql.connector.connect(
                host="localhost",
                user="root",
                password="root",  # Replace with your MySQL password
                database="lab_db"
            )

            cursor = db.cursor(dictionary=True)

            # INTENTIONALLY VULNERABLE: LAB DEMONSTRATION ONLY
            query = (
                f"SELECT * FROM users "
                f"WHERE username = '{username}' "
                f"AND password = '{password}'"
            )

            # Print query for observing SQL construction.
            # Use only dummy lab credentials.
            print("Generated SQL:", query)

            cursor.execute(query)

            # Fetch every matching row
            users = cursor.fetchall()

            if users:
                message = (
                    f"Access Granted! Welcome, "
                    f"{users[0]['username']}."
                )
                status = "success"
            else:
                message = "Access Denied! Invalid credentials."
                status = "error"

        except mysql.connector.Error as err:
            print("MySQL error:", err)
            message = "Database query failed. Check the terminal."
            status = "error"

        finally:
            if cursor is not None:
                cursor.close()

            if db is not None and db.is_connected():
                db.close()

    return render_template_string(
        HTML_PAGE,
        message=message,
        status=status
    )


if __name__ == '__main__':
    # Local machine only; do not expose this vulnerable lab.
    app.run(host='127.0.0.1', port=5000, debug=False)