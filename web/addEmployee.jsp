
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Add Employee</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

        <link rel="stylesheet"
              href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">

        <style>

            body{
                background:#f4f6f9;
            }

            .card{
                border:none;
                border-radius:15px;
                box-shadow:0px 5px 15px rgba(0,0,0,.2);
            }

            .card-header{
                background:#0d6efd;
                color:white;
            }

        </style>

    </head>

    <body>

        <div class="container m-5">

            <div class="row justify-content-center">

                <div class="col-md-8">

                    <div class="card">

                        <div class="card-header">

                            <h3>
                                <i class="fa-solid fa-user-plus"></i>
                                Add Employee
                            </h3>

                        </div>

                        <div class="card-body">

                            <form action="AddEmployeeDB.jsp" method="post">

                                <div class="row">

                                    <div class="col-md-6 mb-3">

                                        <label>Name</label>

                                        <input type="text"
                                               name="name"
                                               class="form-control"
                                               required>

                                    </div>

                                    <div class="col-md-6 mb-3">

                                        <label>Email</label>

                                        <input type="email"
                                               name="email"
                                               class="form-control"
                                               required>

                                    </div>

                                    <div class="col-md-6 mb-3">

                                        <label>Phone</label>

                                        <input type="text"
                                               name="phone"
                                               class="form-control"
                                               required>

                                    </div>

                                    <div class="col-md-6 mb-3">

                                        <label>Gender</label>

                                        <select name="gender" class="form-select">

                                            <option>Male</option>

                                            <option>Female</option>

                                            <option>Other</option>

                                        </select>

                                    </div>

                                    <div class="col-md-6 mb-3">

                                        <label>Department</label>

                                        <input type="text"
                                               name="department"
                                               class="form-control"
                                               required>

                                    </div>

                                    <div class="col-md-6 mb-3">

                                        <label>Designation</label>

                                        <input type="text"
                                               name="designation"
                                               class="form-control"
                                               required>

                                    </div>

                                    <div class="col-md-6 mb-3">

                                        <label>Salary</label>

                                        <input type="number"
                                               name="salary"
                                               class="form-control"
                                               required>

                                    </div>

                                    <div class="col-md-6 mb-3">

                                        <label>Joining Date</label>

                                        <input type="date"
                                               name="joining_date"
                                               class="form-control"
                                               required>

                                    </div>

                                    <div class="col-12 mb-3">

                                        <label>Address</label>

                                        <textarea
                                            name="address"
                                            class="form-control"
                                            rows="3"></textarea>

                                    </div>

                                    <div class="text-center">

                                        <button type="submit"
                                                class="btn btn-primary">

                                            <i class="fa-solid fa-floppy-disk"></i>

                                            Save Employee

                                        </button>

                                        <a href="dashboard.jsp"
                                           class="btn btn-secondary">

                                            <i class="fa-solid fa-arrow-left"></i>

                                            Back

                                        </a>

                                    </div>

                                </div>

                            </form>

                        </div>

                    </div>

                </div>

            </div>

        </div>

    </body>
</html>

