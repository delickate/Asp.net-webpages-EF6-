# Asp.net-webpages-EF6-CodeFirst approach
# User Management Module

This module implements a user management system using ASP.NET Web Pages with the Entity Framework Database First approach. It allows managing users, roles, and permissions efficiently.

## Features

- **User CRUD Operations**: Create, Read, Update, and Delete users with fields like `name`, `email`, `phone`, and more.
- **Role Management**: Assign roles to users from a dropdown populated dynamically from the `roles` table.
- **Permissions**: Role-based access control for user actions like adding, editing, or deleting users.
- **File Upload**: Profile pictures are uploaded and saved in a designated folder.
- **Field Restrictions**: Users with `is_default` set to `true` are protected from editing or deletion.
- **Session-Based Access Control**: Restricts access to pages based on user login status.

## Tables Used

### 1. **users**
| Column Name   | Data Type | Description                             |
|---------------|-----------|-----------------------------------------|
| `id`          | int       | Primary key (auto-generated).           |
| `name`        | string    | Name of the user.                      |
| `email`       | string    | Email of the user.                     |
| `password`    | string    | User's password (encrypted).           |
| `phone`       | string    | Phone number.                          |
| `picture`     | string    | Path to the user's profile picture.    |
| `gender_id`   | int       | Foreign key for the user's gender.     |
| `status`      | bool      | User's active/inactive status.         |
| `is_default`  | bool      | Indicates if the user is protected.    |

### 2. **roles**
| Column Name | Data Type | Description         |
|-------------|-----------|---------------------|
| `id`        | int       | Primary key.        |
| `name`      | string    | Name of the role.   |

### 3. **users_roles**
| Column Name   | Data Type | Description                        |
|---------------|-----------|------------------------------------|
| `id`          | int       | Primary key.                      |
| `user_id`     | int       | Foreign key for the `users` table.|
| `role_id`     | int       | Foreign key for the `roles` table.|

### 4. **roles_modules_permissions_rights**
| Column Name                 | Data Type | Description                                   |
|-----------------------------|-----------|-----------------------------------------------|
| `id`                        | int       | Primary key.                                  |
| `roles_modules_permissions_id` | int   | Foreign key for the `roles_modules_permissions` table. |
| `rights_id`                 | int       | Foreign key for the `rights` table.           |

## Pages

### **1. users-listing.cshtml**
- Displays a list of users.
- Provides action buttons for editing or deleting users based on permissions.
- Includes a link to add new users.

### **2. users-add.cshtml**
- Form for adding a new user.
- Role assignment through a dropdown populated from the `roles` table.
- File upload functionality for profile pictures.

### **3. users-edit.cshtml**
- Pre-populates user data for editing.
- Restricts editing for users with `is_default = true`.

### **4. users-delete.cshtml**
- Deletes a user if `is_default = false`.
- Also removes associated role information from `users_roles`.

### **5. Login.cshtml**
- Validates user credentials.
- Starts a session for authorized users.

### **6. roles-listing.cshtml**
- Displays a list of roles.
- Assigns permissions to roles dynamically.

## Basic concept

### Saving data
HTTP is a stateless protocol. ASP.NET framework helps in storing the information regarding the state of the application, which consists of

- Page state
- Session state

### Application and Session Events
-   **Application_Start** - It is raised when the application/website is started.
    
-   **Application_End** - It is raised when the application/website is stopped.

-   **Session_Start** - It is raised when a user first requests a page from the application.
    
-   **Session_End** - It is raised when the session ends.

### Page and Control Events
-   **DataBinding** - It is raised when a control binds to a data source.
    
-   **Disposed** - It is raised when the page or the control is released.
    
-   **Error** - It is a page event, occurs when an unhandled exception is thrown.
    
-   **Init** - It is raised when the page or the control is initialized.
    
-   **Load** - It is raised when the page or a control is loaded.
    
-   **PreRender** - It is raised when the page or the control is to be rendered.
    
-   **Unload** - It is raised when the page or control is unloaded from memory.

### Directives

#### The Application Directive
The Application directive defines application-specific attributes.
```
<%@  Application  Language="C#" %>
```
#### The Assembly Directive
The Assembly directive links an assembly to the page or the application at parse time.
```
<%@  Assembly  Name  ="myassembly" %>
```
#### The Control Directive
The control directive is used with the user controls and appears in the user control (.ascx) files.
```
<%@  Control  Language="C#"  EnableViewState="false" %>
```
#### The Implements Directive
The Implement directive indicates that the web page, master page or user control page must implement the specified .Net framework interface.
```
<%@  Implements  Interface="interface_name" %>
```
#### The Import Directive
The Import directive imports a namespace into a web page, user control page of application.
```
<%@  namespace="System.Drawing" %>
```
#### The Master Directive
The Master directive specifies a page file as being the mater page.
```
<%@  MasterPage  Language="C#"  AutoEventWireup="true"  CodeFile="SiteMater.master.cs"  Inherits="SiteMaster" %>
```
#### The OutputCache Directive
The OutputCache directive controls the output caching policies of a web page or a user control.
```
<%@  OutputCache  Duration="15"  VaryByParam="None" %>
```
#### The Page Directive
The Page directive defines the attributes specific to the page file for the page parser and the compiler.
```
<%@  Page  Language="C#"  AutoEventWireup="true"  CodeFile="Default.aspx.cs"  Inherits="_Default"  Trace="true" %>
```
#### The PreviousPageType Directive
The PreviousPageType directive assigns a class to a page, so that the page is strongly typed.
```
<%@  PreviousPageType attribute="value"[attribute="value"  ...] %>
```
#### The Reference Directive
The Reference directive indicates that another page or user control should be compiled and linked to the current page.
```
<%@  Reference  Page  ="somepage.aspx" %>
```
#### The Register Directive
The Register derivative is used for registering the custom server controls and user controls.
```
<%@  Register  Src="~/footer.ascx"  TagName="footer"  TagPrefix="Tfooter" %>
```
### State
#### View State
The view state is the state of the page and all its controls. It is automatically maintained across posts by the ASP.NET framework.
-   **The entire application** by setting the EnableViewState property in the <pages> section of web.config file.
    
-   **A page** by setting the EnableViewState attribute of the Page directive, as <%@ Page Language="C#" EnableViewState="false" %>
    
-   **A control** by setting the Control.EnableViewState property.
### Control State
Control state cannot be modified, accessed directly, or disabled.
### Session State
When a user connects to an ASP.NET website, a new session object is created. When session state is turned on, a new session state object is created for each new request. This session state object becomes part of the context and it is available through the page.
### Application State
The ASP.NET application is the collection of all web pages, code and other files within a single virtual directory on a web server. When information is stored in application state, it is available to all the users.

To provide for the use of application state, ASP.NET creates an application state object for each application from the HTTPApplicationState class and stores this object in server memory. This object is represented by class file global.asax.

Application State is mostly used to store hit counters and other statistical data, global application data like tax rate, discount rate etc. and to keep the track of users visiting the site.

## validation controls
-   RequiredFieldValidator
-   RangeValidator
-   CompareValidator
-   RegularExpressionValidator
-   CustomValidator
-   ValidationSummary

#### Razor Syntax for C#

-   C# code blocks are enclosed in @{ ... }
-   Inline expressions (variables or functions) start with @
-   Code statements end with semicolon
-   Variables are declared with the var keyword, or the datatype (int, string, etc.)
-   Strings are enclosed with quotation marks
-   C# code is case sensitive
-   C# files have the extension .cshtml

#### ASP.NET Web Pages - Page Layout
you can use the **@RenderPage()** method to import content from separate files. for example
```
<html>  
<body>  
@RenderPage("header.cshtml")  
<h1>Hello Sani</h1>  
<p>This is a my body content</p>  
@RenderPage("footer.cshtml")  
</body>  
</html>
````
##### Using a Layout Page
Create a layout.cshtml page and call **$RenderBody()** in it.
```
<html>  
<body>  
@RenderPage("header.cshtml")  
@RenderBody()  
@RenderPage("footer.cshtml") 
</body>  
</html>
```
and other pages (aboutus.cshtml) content would be like this
```
@{Layout="Layout.cshtml";}  
  <h1>My body content of this page</h1>  
``` 
####  Logical Folder Structure
-   The "Account" folder contains logon and security files
-   The "App_Data" folder contains databases and data files
-   The "Images" folder contains images
-   The "Scripts" folder contains browser scripts
-   The "Shared" folder contains common files (like layout and style files)

#### The ~ Operator
To specify the virtual root in programming code, use the **~** operator.
#### The Server.MapPath Method
The Server.MapPath method converts a virtual path to a physical path that the server can understand
#### The Href Method
The Href method converts a path used in the code to a path that the browser can understand (the browser cannot understand the ~ operator).
```
@{var myStyleSheet = "~/Shared/Site.css";}  
  
<!-- This creates a link to the CSS file. -->  
<link rel="stylesheet" type="text/css" href="@Href(myStyleSheet)" />  
  
<!-- Same as : -->  
<link rel="stylesheet" type="text/css" href="/Shared/Site.css" />
```
#### Global Pages
###### _AppStart (Before Web Startup)
By creating a page named _AppStart in the root of your site, you can have startup code executed before the site starts. If this page exists, ASP.NET runs it the first time any page in the site is requested.

Typical use for _AppStart is startup code and initialization of global values like counters and global names.

##### _PageStart ( Before Every Page)
Just like _AppStart runs before your site starts, you can write code that runs before any page in each folder.

For each folder in your web, you can add a file named _PageStart.

Typical use for _PageStart is setting the layout page for all pages in a folder, or checking that a user is logged in before running a page.



