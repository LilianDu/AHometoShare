<%-- 
File: index.html
Description: A page for logged-in renters to view and edit profile details
Create: Sept.30,2018
Author: Chris Labelle
Clients: Michelle Bilek, Farheen Khan
Course: Software Development Project
Professor: Dr. Anu Thomas
Project: A Home to Share
Copyright @ 2018
--%>

<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>My Profile</title>
        <link rel="stylesheet" href="assets/css/renterProfile_style.css" />
    </head>
    
    <body class="subpage">
        <!-- Header -->
        <header id="header">
            <div class="inner">
                <a href="index.html" class="logo">A Home To Share</a>
                <nav id="nav">
                    <a href="index.jsp">Home</a>
                    <a href="index.jsp">How We Work</a>
                    <a href="index.jsp">FAQ</a>
                    <a href="
                       <%=session.getAttribute("isLoggedIn") != null ? (session.getAttribute("userType").toString().equals("renter") ? "renterProfile.jsp" : "hostProfile.jsp") : "index.jsp"%>" 
                       style="
                       <%=session.getAttribute("isLoggedIn") != null ? "display: inline;" : "display: none;"%>">My Account</a>
                    <button id="logoutBtn" class="unstyled-button" onclick="window.location.href='LogoutRedirect'" style="<%=session.getAttribute("isLoggedIn") != null ? "display: inline;" : "display: none;"%>">Log out</button>
                </nav>
            </div>
        </header>
        
        <!--Main Frame-->
        <div class="wrapper">

            <!--Pane 1: a placeholder-->    
            <li class="aside aside-1"></li>

            <!--Pane 2: "My Account" - menu buttons-->
            <li class="aside aside-2">
                <div class="btn-group-vertical">
                    <ul id="horizontal-list">
                        <li><hr class="welcome_block" align="left"></li>
                        <li><h3>Hello <%out.print(session.getAttribute("firstName"));%>!</h3><li>
                    </ul >
                    <ul style="list-style:none;">
                        <li id="menu1"><input type="button" value="My Profile" class="" onclick="window.location.href='renterProfile.jsp'"/></li>
                        <li id="menu2"><input type="button" value="Account Settings" class="" onclick="window.location.href='renterAccountSettings.jsp'" /></li>
                        <li id="menu3"><input type="button" value="Search Host Listings" onclick="window.location.href='renterProfileSearch.jsp'" /></li>
                    </ul>
                </div>
            </li>

            <!--Pane 3: "My Account" content container-->
                <!--Pane 3: "My Account" - My Profile contents-->
                <li class="aside aside-3">
                    <div class="my_profile_content">
                        <form method="get" action="ProfileRenterView" onsubmit="return checkForm(this)" >

                        <h2>Personal details</h2>

                        <hr width=600px;>

                        <!-- Break: First/Last name, Gender, Birth year, Phone number, Student, Employed, Smoker -->
                            <!--<ul style="list-style:none;">-->
                            <div class="profile_sections">
                                <li class=""><h4>First name<span style="color:red; font-weight:bold">*</span></h4></li>
                                <li><input type="text" name="firstname" id="firstname" value="<%=session.getAttribute("firstName")%>" size="45" maxlength="45" pattern="[A-Za-z]{1,45}" required></li>
                            </div>

                            <div class="profile_sections">
                                <li class=""><h4>Last name<span style="color:red; font-weight:bold">*</span></h4></li>
                                <li><input type="text" name="lastname" id="lastname" value="<%=session.getAttribute("lastName")%>" size="45" maxlength="45" pattern="[A-Za-z]{1,45}" required></li>
                            </div>

                            <div class="profile_sections">
                                <li><h4>Gender<span style="color:red; font-weight:bold">*</span></h4></li>
                                <li>
                                    <select name="gender" id="gender" required >
                                        <%
                                            out.println("<option value=\"\">- Select your gender -</option>");
                                            switch(Integer.parseInt(session.getAttribute("gender").toString())) {
                                                case 0: 
                                                    out.println("<option selected=\"selected\" value=\"0\">Male</option>");
                                                    out.println("<option value=\"1\">Female</option>");
                                                    break;
                                                case 1: 
                                                    out.println("<option value=\"0\">Male</option>");
                                                    out.println("<option selected=\"selected\" value=\"1\">Female</option>");
                                                    break;
                                            }
                                        %>     
                                    </select>
                                </li>
                            </div>

                            <div class="profile_sections">
                                <li><h4>Birth year<span style="color:red; font-weight:bold">*</span></h4></li>
                                <li>
                                    <select name="yearBorn" id="yearBorn" required >
                                        <%
                                            out.println("<option value=\"\">- Select the year you were born  -</option>");
                                            for(int i = 2000; i > 1982; i--) {
                                                if(i == Integer.parseInt((session.getAttribute("dateBirth").toString()))) {
                                                    out.println("<option selected=\"selected\" value=\"" + i + "\">" + i + "</option>");
                                                }
                                                else {
                                                    out.println("<option value=\"" + i + "\">" + i + "</option>");
                                                }
                                            }
                                        %>     
                                    </select>
                                </li>
                            </div>

                            <div class="profile_sections">
                                <li><h4>Phone number</h4></li>
                                <li><input type="tel" name="phoneNum" id="phoneNum" value="<%=session.getAttribute("phone")%>" size="45" pattern="[0-9]{3}-[0-9]{3}-[0-9]{4}" /></li>
                            </div>

                            <div id="checkbox_items">
                                <li id="checkbox1"><input type="checkbox" name="isStudent" id="isStudent" 
                                    <%=Boolean.parseBoolean(session.getAttribute("isStudent").toString()) ? "checked" : ""%>>Student?</input>
                                </li>

                                <li id="checkbox2"><input type="checkbox" name="isEmployed" id="isEmployed" 
                                    <%=Boolean.parseBoolean(session.getAttribute("isEmployed").toString()) ? "checked" : ""%>>Employed?</input>
                                </li>

                                <li id="checkbox3"><input type="checkbox" name="isSmoker" id="isSmoker" 
                                    <%=Boolean.parseBoolean(session.getAttribute("isSmoker").toString()) ? "checked" : ""%>>Smoker?</input>
                                </li>
                            </div>

                        <!-- Break: Renting Details -->
                            <h2 class="renting_details">Renting details</h2>

                            <hr width=600px;>

                            <div class="profile_sections">
                                <li><h4>Start date</h4></li>
                                <li><input type="date" name="startDate" id="startDate" 
                                           value="<%=session.getAttribute("startDate")%>" maxlength="10" pattern="[0-9-]{8,10}" required /></li>
                            </div>

                            <div class="profile_sections">
                                <li><h4>End date</h4></li>
                                <li><input type="date" name="endDate" id="endDate" 
                                           value="<%=session.getAttribute("endDate")%>" maxlength="10" pattern="[0-9-]{8,10}" required /></li>
                            </div>

                            <div class="profile_sections">
                                <li><h4>Low price</h4></li>
                                <li><input type="text" name="lowPrice" id="lowPrice" 
                                           value="<%=session.getAttribute("lowPrice")%>" maxlength="10" pattern="[0-9\.]+" required /></li>
                            </div>

                            <div class="profile_sections">
                                <li><h4>High price</h4></li>
                                <li><input type="text" name="highPrice" id="highPrice" 
                                           value="<%=session.getAttribute("highPrice")%>" maxlength="10" pattern="[0-9\.]+" required /></li>
                            </div>
                            <!--
                            <span id="entryError"><%out.print(session.getAttribute("invalidReason") == null ? "" : session.getAttribute("invalidReason"));%></span>
                            -->
                        <!-- Break: Save button, Cancel button -->
                            <div id="save_cancel_btn">
                                <button id="save_btn" type="submit">Save changes</button>
                                <button id="cancel_btn" type="reset" onclick="renterProfile.jsp">Cancel</button>
                            </div>
                        </form>
                    </div>

                </li>

            <!--Pane 4: a placeholder-->  
                <li class="aside aside-4"></li>
        </div>



        
        <!-- Footer -->
        <footer id="footer">
            <div class="inner">
                <div class="flex">
                    <div class="single-footer-widget">
                        <h6>Get in Touch</h6>
                        <div class='get-in-touch-section'>
                            <img alt="logo" class="" src="images/team_logo.png" />
                            <ul class="footer-nav-section-nav pL0">
                                <li><a href="mailto:hello@nesterly.io">info@ahometoshare.ca</a></li>
                                <li><a class="remove-cursor" href="#">(123) 456-7890</a></li>
                            </ul>
                        </div>
                    </div>

                    <div class="col-lg-3  col-md-3">
                        <div class="single-footer-widget">
                            <h6>Join Our Community</h6>
                            <ul class="footer-nav-section-nav pL0">
                                <li><a href="/how-it-works">How it Works</a></li>
                                <li><a href="/faq">Frequently Asked Questions</a></li>
                                <li><a href="/homesharing_resources">Homesharing Resources</a></li>
                                <li><a href="/community_compact">Community Compact</a></li>
                            </ul>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-3">
                        <div class="single-footer-widget">
                            <h6>Get Engaged</h6>
                                <ul class="footer-nav-section-nav pL0">
                                    <li>Live in Toronto and want to help us tackle the affordable housing crisis. <a href="" target="_blank"> <u>Apply</u></a> to be an Ambassador today.
                                    </li>
                                </ul>
                        </div>
                    </div>

                    <div class="col-lg-3  col-md-3">
                        <div class="single-footer-widget">
                            <h6>Follow us on Social</h6>
                                <a href="https://www.facebook.com/ahometoshare" class="btn btn-facebook waves-effect waves-light">
                                        <i class="fa fa-facebook" aria-hidden="true"></i>
                                </a>
                                &nbsp;&nbsp;
                                <a href="https://twitter.com/ahometoshare" class="btn btn-twitter waves-effect waves-light">
                                    <i class="fa fa-twitter" aria-hidden="true"></i>
                                </a>
                        </div>
                    </div>
                </div>
            </div>
        </footer> 
        
    </body>
</html>