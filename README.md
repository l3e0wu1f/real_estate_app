# 🏡 Real Estate Listing App
<br>
A modern full‑stack **Ruby on Rails** application for browsing, filtering, and managing real estate listings. Built as a flagship portfolio project to demonstrate clean architecture, scalable design patterns, and a polished user experience.

### **Key Features**
- Photo uploads with Active Storage + on‑the‑fly image variants  
- Advanced search & filtering (price, beds, baths, keyword search with PgSearch)  
- Geolocation & mapping (property coordinates, map integration)  
- Agent profiles and listing ownership  
- Background jobs for image processing and geocoding  
- Modern UI using Tailwind CSS  
- Production deployment on Railway  

### **Live Demo:**  
<a href="https://realestateapp-production-bfb3.up.railway.app/properties" target="_blank">https://realestateapp-production-bfb3.up.railway.app/properties</a>

---

# Installation
Follow these steps to run the project locally.

### **1. Clone the repository**
```bash  
git clone https://github.com/yourusername/real_estate_app.git  
cd real_estate_app
```

### **2. Install Ruby and Rails**
This project uses Ruby 3.2.2 and Rails 8.1.3.  
<br>
If using rbenv:  
```bash  
rbenv install 3.2.2
rbenv local 3.2.2  
gem install bundler  
```

### **3. Install dependencies**
```bash  
bundle install
```

### **4. Install JavaScript & CSS tooling**
This app uses Tailwind CSS and ESBuild.
```bash  
yarn install
```

### **5. Set up the database**
```bash  
rails db:create
rails db:migrate
```

### **6. Install Active Storage**
```bash  
rails active_storage:install
rails db:migrate
```

### **7. Start the development server**
```bash  
bin/dev
```
<br>
Your app will be available at: <a href="http://localhost:3000">http://localhost:3000</a>


# Architecture Overview
This project is structured to demonstrate clean, scalable Rails architecture with modern frontend tooling.  

### *Core Components*
### **1. Rails 7/8 Application**
- Standard MVC architecture
- RESTful controllers
- Strong parameters
- Background jobs for geocoding and image processing
### **2. PostgreSQL Database**
- Stores property listings, agents, and metadata
- Uses pg_trgm for fuzzy search
- Full‑text search powered by PgSearch
### **3. Active Storage**
- Handles photo uploads
- Generates responsive image variants
- Local storage in development, cloud storage in production
### **4. Tailwind CSS**
- Utility‑first styling
- Responsive grid layouts for property cards
- Minimal custom CSS for maintainability
### **5. ESBuild + Import Maps**
- Fast JavaScript bundling
- Lightweight frontend footprint
- Optional Stimulus integration
### **6. Geolocation & Mapping**
- Properties store latitude/longitude
- Mapbox or Google Maps integration
- Reverse geocoding via background jobs
### **7. Search & Filtering**
- Keyword search with PgSearch
- Range filters (price, bedrooms, bathrooms)
- Composable ActiveRecord scopes for clean query logic