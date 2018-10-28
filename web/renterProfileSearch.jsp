<%-- 
File: renterProfileSearch.jsp
Description: Page for searching host listings within the renter profile.
Create: Oct 21,2018
Author: Melissa Rajala
Modified by: Zhan Shen - updated layout related code
Clients: Michelle Bilek,Farheen Khan
Course: Software Development Project
Professor: Dr. Anu Thomas
Project: A Home to Share
Copyright @ 2018
--%>

<%@page import="java.util.Map.Entry"%>
<%@page import="java.util.ArrayList"%>
<%@page import="transferobjects.Host"%>
<%@page import="transferobjects.Property"%>
<%@page import="java.util.List"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Renter Host Property Search</title>
        <link rel="stylesheet" href="assets/css/renterProfileSearch_style.css" />
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
                       <%=session.getAttribute("isLoggedIn") != null ? "display: inline;" : "display: none;"%>">My Profile</a>
                    <button id="logoutBtn" class="unstyled-button" onclick="window.location.href='LogoutRedirect'" style="<%=session.getAttribute("isLoggedIn") != null ? "display: inline;" : "display: none;"%>">Log out</button>
                </nav>
            </div>
        </header>
                      
                
        <script>
            function myFilterFunction() {
                // Declare variables

                var select = document.getElementById("select");
                var selectedCity = select.options[select.selectedIndex].text;


                // Loop through all list items, and hide those who don't match the search query
                var li;
                table = document.getElementById("property");
                li = table.getElementsByTagName("li");

                var i;
                    for (i = 1; i<li.length; i++){
                        var text = "";
                        text = li[i].value;
                        window.alert(text); //for debugging
                    }
            }
        </script>        
                
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
                            <li id="menu1"><input type="button" value="My Profile" class="" onclick="window.location.href='renterProfile.jsp'" /></li>
                            <li id="menu2"><input type="button" value="Account Settings" class="" onclick="window.location.href='renterAccountSettings.jsp'" /></li>
                            <li id="menu3"><input type="button" value="Search Host Listings" onclick="window.location.href='RenterProfileSearch'" /></li>
                        </ul>
                    </div>
                </li>    


                <!--Pane 3: "My Account" - Renter Search Host Listings contents-->
                <li class="aside aside-3">
                    <div class="property_search_content">
                        <form method="get" action="RenterProfileSearch" >
                        
                            <h2>Search Host Properties</h2>

                            <hr width=600px;>                       
                        
                            <!-- Break: Filter items -->
                                <div class="profile_sections">
                                    <li class="filters"><h4>Filter by location</h4></li>
                                    <li>
                                        <select name="location" id="location">
                                            <option name="mississauga" value="mississauga">Mississauga</option>
                                            <option name="hamilton" value="hamilton">Hamilton</option>
                                            <option name="peel" value="peel">Peel Region</option>
                                        </select>
                                    </li>
                                </div>

                                <div class="profile_sections">
                                    <li class="filters"><h4>Sort by price</h4></li>
                                    <li>
                                        <select name="price" id="price">
                                            <option value="low">Low to High</option>
                                            <option value="high">High to Low</option>
                                        </select>
                                    </li>
                                </div>

                            <!-- Break: Checkboxes -->    
                                <div id="checkbox_items">
                                    <li id="checkbox1">
                                        <input type="checkbox" name="req" id="req" value="prvbath"> Private bathroom</input>
                                    </li>

                                    <li id="checkbox2">
                                        <input type="checkbox" name="req" id="req" value="parking"> Parking</input>
                                    </li>

                                    <li id="checkbox3">
                                        <input type="checkbox" name="req" id="req" value="prvkitchen"> Private kitchen</input>
                                    </li>
                                </div>
                        
                            <!-- Break: Search button, Reset button -->
                                <div id="search_reset_btn">
                                    <button id="filter_btn" type="button" value="Search" onclick="myFilterFunction();">Search</button>
                                    <button id="cancel_btn" type="reset" onclick="RenterProfileSearch">Reset</button>
                                </div>
                        </form>  
                        
                            <!-- Break: Search results -->
                                <h2 class="searching_results">Searching results</h2>

                                <hr width=600px;>

                                <div class="">
                                    <table class="hosttable" id="property">
                                        <%
                                            List<Entry<Host,Property>> pairList = (ArrayList<Entry<Host, Property>>) request.getAttribute("hostproperties");
                                            if (pairList.isEmpty()) { 
                                        %>
                                                <h6>There are no available listings at this time.</h6>
                                        <%
                                            } else {
                                        %>
                                            <tr>
                                                <th>Property ID</th>
                                                <th>|Host ID</th>
                                                <th>|Host name</th>
                                                <th>|Address</th>
                                                <th>|City</th>
                                                <th>|Start date</th>
                                                <th>|End date</th>
                                                <th>|Price</th>
                                            </tr>
                                        <%        
                                            for (Entry entry: pairList){
                                                Host host = (Host) entry.getKey();
                                                Property property = (Property) entry.getValue();
                                                String city = property.getCity();
                                        %>
                                                <tr>
                                                    
                                                    <td><%=property.getpropertyID()%></td>
                                                    <td><%=property.getHostID()%></td>
                                                    <td><%=host.getFirstName()%></td>
                                                    <td><%=property.getAddress()%></td>
                                                    <td><li value="hi"><%=city%></li></td>
                                                    <td><%=property.getStartDate()%></td>
                                                    <td><%=property.getEndDate()%></td>
                                                    <td><%=property.getPrice()%></td>
                                                    <td><input id="view_details_btn" type="button" value="Details" onclick="window.location.href='RenterProfileSearchDetails'" /></td>
                                                </tr>
                                            <%}

                                            }
                                            %>                         
                                    </table>
                                </div>                          
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
