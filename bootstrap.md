---
tags: #bootstrap,#css,#www,#web
---
# Bootstrap

## Bootstrap Tables

elow is an example that shows you how to create a table, .table-striped, with rows of alternating colors.

| First Name | Last Name | Student ID |
| ---------- | --------- | ---------- |
| Mary       | Smith     | 100001     |
| John       | Dan       | 100002     |
| Jessica    | Cooper    | 100003     |

The code to generate a table like the one above is given by:

```html
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">        
  <table class="table table-striped">
    <thead>
      <tr>
        <th>First Name</th>
        <th>Last Name</th>
        <th>Student ID</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>Mary</td>
        <td>Smith</td>
        <td>100001</td>
      </tr>
      <tr>
        <td>John</td>
        <td>Dan</td>
        <td>100002</td>
      </tr>
      <tr>
        <td>Jessica</td>
        <td>Cooper</td>
        <td>100003</td>
      </tr>
    </tbody>
  </table>
</div>
</body>
</html>
```
