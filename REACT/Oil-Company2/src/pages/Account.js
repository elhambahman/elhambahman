import React, { useState } from 'react';
import '../App.css';
import "bootstrap/dist/css/bootstrap.min.css";
import "bootstrap/dist/js/bootstrap.bundle.min";
import { Navbar,Image, Container , Nav ,Button ,Link, Card} from 'react-bootstrap';
import { useNavigate } from 'react-router-dom';
import '../styles.css';
import MyFooter from './MyFooter';

function Header() {
 
  const navigate = useNavigate();

  return (
    <div className="App"  dir='rtl'>
      <header className="App-header " >
       <Navbar expand="lg" className="bg-secondary">
       <Container>
       <Navbar.Brand href="#home" > شرکت نفت ایران</Navbar.Brand>
       <Navbar.Toggle aria-controls="basic-navbar-nav" />
       <Navbar.Collapse id="basic-navbar-nav">
          <Nav dir='rtl' className='px-4'>
            <Nav.Link href="/" className='px-4 fs-5'>بازگشت به صفحه اصلی </Nav.Link>
            <Nav.Link href="#list" className='px-4 fs-5'>میز کار</Nav.Link>
      
          </Nav>
        </Navbar.Collapse>
        <Button variant="primary" onClick={() => navigate('/')}>خروج از حساب</Button>

      </Container>
      </Navbar>
      </header>
      <div class="alert alert-success pe-5">
         <h2>پنل کاربری </h2>
       </div>
      <div className="card-container d-flex flex-wrap text-center"> 
       <Card.Link style={{ width: '18rem' , color: 'white' , textDecoration: 'none' }} className='card m-4'>
      <Card.Body style={{background: 'DarkCyan' , borderRadius: '5px' }}>
        <Card.Title>پروفایل من</Card.Title>
        <i class="bi bi-person-fill" style={{fontSize: '4em' }}></i>
        </Card.Body>
    </Card.Link>
    <Card.Link style={{ width: '18rem' , color: 'white' , textDecoration: 'none'}} className='card m-4'>
      <Card.Body style={{background: 'SlateBlue' , borderRadius: '5px' }}>
        <Card.Title>ثبت نمایندگی</Card.Title>
        <i class="bi bi-award-fill" style={{fontSize: '4em'}}></i>
      </Card.Body>
    </Card.Link>
    <Card.Link  href="/Addcompany" style={{ width: '18rem' , color: 'white' , textDecoration: 'none'}} className='card m-4'>
      <Card.Body style={{background: 'SpringGreen' , borderRadius: '5px' }}>
        <Card.Title>مدیریت قراردادها </Card.Title>
        <i class="bi bi-journal-text"  style={{fontSize: '4em'}}></i>
      </Card.Body>
    </Card.Link>
    <Card.Link style={{ width: '18rem' , color: 'white', textDecoration: 'none' }} className='card m-4'>
      <Card.Body style={{background: 'Peru' , borderRadius: '5px' }}>
        <Card.Title>ثبت و پیگیری درخواست مشتری </Card.Title>
        <i class="bi bi-list-check" style={{fontSize: '4em'}}></i>
      </Card.Body>
    </Card.Link>
    <Card.Link style={{ width: '18rem' , color: 'white', textDecoration: 'none' }} className='card m-4 special-card'>
      <Card.Body style={{background: 'Orchid' , borderRadius: '5px' }}>
        <Card.Title>هویت سنجی</Card.Title>
        <i class="bi bi-person-check-fill" style={{fontSize: '4em'}}></i>      
        </Card.Body>
    </Card.Link>
    <Card.Link style={{ width: '18rem' , color: 'white', textDecoration: 'none' }} className='card m-4'>
      <Card.Body style={{background: 'SpringGreen' , borderRadius: '5px' }}>
        <Card.Title>استعلام وضعیت محصولات </Card.Title>
        <i class="bi bi-truck-flatbed" style={{fontSize: '4em'}}></i>
         </Card.Body>
    </Card.Link>
    <Card.Link style={{ width: '18rem' , color: 'white', textDecoration: 'none' }} className='card m-4'>
      <Card.Body style={{background: 'SandyBrown' , borderRadius: '5px' }}>
        <Card.Title>  ثبت خرید و فروش  </Card.Title>
        <i class="bi bi-cart-check-fill"  style={{fontSize: '4em'}}></i>
      </Card.Body>
    </Card.Link>
    <Card.Link style={{ width: '18rem' , color: 'white' , textDecoration: 'none'}} className='card m-4'>
      <Card.Body style={{background: 'SlateBlue' , borderRadius: '5px' }}>
        <Card.Title>نتایج محرمانه آخرین جلسات </Card.Title>
        <i class="bi bi-chat-square-dots-fill" style={{fontSize: '4em'}}></i>
      </Card.Body>
    </Card.Link>
    <div>
  <Image src={require('../images/37.png')} style={{ position: "absolute", top: "165px", left: "30px", width: "250px", height: "auto" }} />
</div>
    
       </div>
       <div style={{marginTop:'4cm'}}>
       <MyFooter />
       </div>
      </div>
  );
}
  export default Header;
