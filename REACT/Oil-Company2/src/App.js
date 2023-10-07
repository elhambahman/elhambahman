import React, { useState } from 'react';
import './App.css';
import { BrowserRouter as Router ,Routes , Route } from 'react-router-dom'; 
import "bootstrap/dist/css/bootstrap.min.css";
import "bootstrap/dist/js/bootstrap.bundle.min";
import Account from './pages/Account';
import Home from './pages/Home';
import Header from './pages/Header';
import MyFooter from './pages/MyFooter';
import Addcompany from './pages/Addcompany';




function App() {
  return (
    <div className="App">
    <Routes>
      <Route path="/" element={<Home />} />
      <Route path="/Account" element={<Account />} />
      <Route path="/Header" element={<Header />} />
      <Route path="/MyFooter" element={<MyFooter />} />
      <Route path="/Addcompany" element={<Addcompany />} />
    </Routes>
  </div>
  );
}

export default App;
