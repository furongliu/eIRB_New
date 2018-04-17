<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Template.aspx.cs" Inherits="eIRB_new.Template" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        .site {
            display: grid;
            border: 1px;
            grid-template-columns: 2fr 1fr 1fr;
            grid-template-rows: auto 1fr 3fr;
            grid-template-areas: "title title title" "main header header" "main sidebar footer";
        }

        .masthead {
            grid-area: header;
        }

        .page-title {
            grid-area: title;
        }

        .main-content {
            grid-area: main;
        }

        .sidebar {
            grid-area: sidebar;
        }

        .footer {
            grid-area: footer;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="site" style="background-color: darkgreen;">
            .site
        <header class="masthead" style="background-color: fuchsia;">
            .masthead
        </header>

            <h1 class="page-title" style="background-color: brown;">.page-title
            </h1>

            <main class="main-content" style="background-color: royalblue;">
            .main-content
        </main>

            <aside class="sidebar" style="background-color: darkgray;">
                .sidebar
            </aside>

            <footer class="footer" style="background-color: yellow;">
                .footer
            </footer>

        </div>
    </form>
</body>
</html>
