module ApplicationHelper

def select_all_state
     ["Andaman & Nicobar", "Andhra Pradesh", "Arunachal Pradesh", "Assam", "Bihar", "Chandigarh", "Chhattisgarh", "Dadra & Nagar Haveli", "Daman & Diu", "Delhi", "Goa", "Gujarat", "Haryana", "Himachal Pradesh", "Jammu & Kashmir", "Jharkhand", "Karnataka", "Kerala", "Lakshadweep", "Madhya Pradesh", "Maharashtra", "Manipur", "Meghalaya", "Mizoram", "Nagaland", "Orissa", "Pondicherry", "Punjab", "Rajasthan", "Sikkim", "Tamil Nadu", "Tripura", "Uttar Pradesh", "Uttaranchal", "West Bengal"]
end 

def select_all_district 
[
"Sangli",
"Satara",
"Solapur",
"Kolhapur",
"Pune",
"Akola",
"Amravati",
"Buldhana",
"Yavatmal",
"Washim",
"Sambhaji nagar",
"Beed",
"Jalna",
"Dharashiv",
"Nanded",
"Latur",
"Parbhani",
"Hingoli",
"Bhandara",
"Chandrapur",
"Gadchiroli",
"Gondia",
"Nagpur",
"Wardha",
"Ahmednagar",
"Dhule",
"Jalgaon",
"Nandurbar",
"Nashik",
"Mumbai City district",
"Mumbai Suburban district",
"Thane",
"Palghar",
"Raigad",
"Ratnagiri",
"Sindhudurg",]

end 
def select_city 
     CS.cities(state, country)
end 


end
