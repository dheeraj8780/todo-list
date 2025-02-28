<%@page import="beans.Task"%>
<%@page import="java.util.List"%>
<%@page import="dao.ToDoDAO"%>
<%@page import="dao.ToDoDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ToDo List</title>

    <!-- Bootstrap CSS -->
    <link href="bootstrap.min.css" rel="stylesheet">
    
    <!-- jQuery -->
    <script src="jquery-3.5.1.slim.min.js"></script>
    
    <!-- Bootstrap JS (requires jQuery) -->
    <script src="bootstrap.bundle.min.js"></script>
    
    <style>
        .container {
            margin-top: 50px;
        }
        .task-table th, .task-table td {
            text-align: center;
        }
        .completed-task {
            text-decoration: line-through;
        }
    </style>
    
	<link href='jquery-ui.css' rel='stylesheet'>
 
    <script src="jquery.min.js"></script>
 
    <script src="jquery-ui.min.js"></script> 
</head>
<body>

    <div class="container">
        <!-- Welcome message -->
        <p class="text-right">
            Welcome 
            <b style="color:red">
                <%=session.getAttribute("email")%>
            </b>,
            <a href="./LogoutServlet">Logout</a>
        </p>

        <!-- Add Task Form -->
        <form method="post" action="./AddTaskServlet">
            <div class="card">
                <div class="card-header">
                    <h4>Add Task</h4>
                </div>
                <div class="card-body">
                    <table class="table table-bordered">
                        <tr>
                            <th>Task Name</th>
                            <td><input type="text" name="taskName" class="form-control" required></td>
                        </tr>
                        <tr>
                            <th>Task Date</th>
                            <td><input type="text" name="taskDate" id="taskDate" class="form-control" placeholder="dd-mm-yyyy" required></td>
                        </tr>
                        <tr>
                            <th>Task Status</th>
                            <td>
                                <select name="taskStatus" class="form-control" required>
                                    <option value="1">Not Yet Started</option>
                                    <option value="2">Pending</option>
                                    <option value="3">Completed</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th><input type="submit" name="submit" value="Add Task" class="btn btn-primary btn-block"></th>
                            <td><input type="reset" name="reset" value="Clear" class="btn btn-secondary btn-block"></td>
                        </tr>            
                    </table>
                </div>
            </div>
        </form>

        <br/>
        <hr width="50%" border="1"/>

        <!-- Task List -->
        <%
            String email = session.getAttribute("email").toString();
            int regid = ((Integer) session.getAttribute("regid")).intValue();
            ToDoDAO dao = new ToDoDAOImpl();
            List<Task> taskList = dao.findAllTasks(regid);
        %>

        <table class="table table-bordered task-table">
            <thead class="thead-dark">
                <tr>
                    <th>Task ID</th>
                    <th>Task Name</th>
                    <th>Task Date</th>
                    <th>Task Status</th>
                </tr>
            </thead>
            <tbody>
                <%
                    for (Task task : taskList) {
                        int status = task.getTaskStatus();
                        if (status == 3) {
                %>
                    <tr class="completed-task">
                        <td><%= task.getTaskid() %></td>
                        <td><%= task.getTaskName() %></td>
                        <td><%= task.getTaskDate() %></td>
                        <td>Completed</td>
                    </tr>
                <%
                        } else {
                %>
                    <tr>
                        <td><%= task.getTaskid() %></td>
                        <td><%= task.getTaskName() %></td>
                        <td><%= task.getTaskDate() %></td>
                        <td><a href='./TaskCompletedServlet?taskid=<%= task.getTaskid() %>' class="text-danger">Complete</a></td>
                    </tr>
                <%
                        }
                    }
                %>
            </tbody>
        </table>

        <p class="text-center"><a href="./LogoutServlet">Logout</a></p>
    </div>

    <!-- Optional: You can add custom JS for additional interactions -->
    <script>
        $(document).ready(function() {
        	 $("#taskDate").datepicker();
        });
    </script>
    
</body>
</html>
