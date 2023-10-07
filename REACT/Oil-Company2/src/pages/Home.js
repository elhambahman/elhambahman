import React, { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import '../App.css';
// Bootstrap CSS
import "bootstrap/dist/css/bootstrap.min.css";
// Bootstrap Bundle JS
import "bootstrap/dist/js/bootstrap.bundle.min";
import { Navbar,Image, Container , Nav, NavDropdown ,Button , CloseButton  , Card, ButtonGroup, DropdownButton,Dropdown,Modal, Form , Breadcrumb} from 'react-bootstrap';
import MyFooter from './MyFooter';


function Home() {
  const [showLogin, setshowLogin] = useState(false);
  const [showSignup, setshowSignup] = useState(false);

  const handleClose = () => setshowLogin(false);
  const handleShow = () => setshowLogin(true);

  const handleClose2 = () => setshowSignup(false);
  const handleShow2 = () => setshowSignup(true);

  const navigate = useNavigate();

  const handleLogin = () => {
    // اعتبارسنجی ورودی ها و انجام عملیات ورود به سیستم

    // انتقال کاربر به صفحه پروفایل
    navigate('/Account');
  };


  const handleRegistration = () => {
 // اعتبارسنجی ورودی ها و انجام عملیات ثبت نام

    // انتقال کاربر به صفحه پروفایل
    navigate('/Account');
  };
  return (
    <div className="App"  dir='rtl'>
      <header className="App-header ">
       <Navbar expand="lg" className="bg-secondary">
       <Container>
       <Navbar.Brand href="#home" > شرکت نفت ایران</Navbar.Brand>
       <Navbar.Toggle aria-controls="basic-navbar-nav" />
       <Navbar.Collapse id="basic-navbar-nav">
          <Nav dir='rtl' className='px-4'>
            <Nav.Link href="#Home" className='px-4 fs-5'>صفحه اصلی</Nav.Link>
            <Nav.Link href="#list" className='px-4 fs-5'>سهامداران</Nav.Link>
            <Nav.Link href="#link" className='px-4 fs-5'>اخبار</Nav.Link>
            <Nav.Link href="#link" className='px-4 fs-5'>مقالات</Nav.Link>
            <NavDropdown title="فراخوان ها" id="basic-nav-dropdown" className='px-4 fs-5'>
              <NavDropdown.Item href="#action/3.1">جدیدترین فراخوان</NavDropdown.Item>
              <NavDropdown.Item href="#action/3.2">
               آرشیو فراخوان ماه اخیر
              </NavDropdown.Item>
              <NavDropdown.Item href="#action/3.3">ثبت درخواست </NavDropdown.Item>
              <NavDropdown.Divider />
              <NavDropdown.Item href="#action/3.4">
                نتایج نهایی
              </NavDropdown.Item>
            </NavDropdown>
          </Nav>
        </Navbar.Collapse>
        <ButtonGroup>
        <DropdownButton as={ButtonGroup} title="ورود" id="bg-nested-dropdown">
        <Dropdown.Item eventKey="1" onClick={handleShow}>ورود </Dropdown.Item>
        <Modal show={showLogin} onHide={handleClose} dir='rtl'>
        <Modal.Header closeButton={false} className='closeButten'>
          <Button className='bg-light text-dark' onClick={handleClose}>
          &times;
          </Button>      
          <Modal.Title >ورود کاربر</Modal.Title>
        </Modal.Header>
        <Modal.Body>
          <Form>
            <Form.Label>نام کاربری </Form.Label>
            <Form.Group className="mb-3" controlId="exampleForm.ControlInput1">
              <Form.Control
                type="name"
                autoFocus
              />
            </Form.Group>
            <Form.Label>رمز عبور</Form.Label>
            <Form.Group className="mb-3" controlId="exampleForm.ControlInput1">
              <Form.Control
                type="password"
                autoFocus
              />
            </Form.Group>
          </Form>
        </Modal.Body>
        <Modal.Footer>
          <Button variant="secondary" onClick={handleClose}>
            بستن
          </Button>
          <Button variant="primary" onClick={handleLogin}>
            تایید
          </Button>
        </Modal.Footer>
      </Modal>

      <Dropdown.Item eventKey="2" onClick={handleShow2}>ثبت نام</Dropdown.Item>
        <Modal show={showSignup} onHide={handleClose2} dir='rtl'>
        <Modal.Header closeButton={false} className='closeButten'>
          <Button className='bg-light text-dark' onClick={handleClose2}>
          &times;
          </Button>
          <Modal.Title >ثبت نام کاربر</Modal.Title>
        </Modal.Header>
        <Modal.Body>
          <Form>
          <Form.Group className="mb-3" controlId="exampleForm.ControlInput1">
              <Form.Label>ایمیل</Form.Label>
              <Form.Control
                type="email"
                placeholder="name@example.com"
                autoFocus
              />
            </Form.Group>
            <Form.Label>نام کاربری </Form.Label>
            <Form.Group className="mb-3" controlId="exampleForm.ControlInput1">
              <Form.Control
                type="name"
                autoFocus
              />
            </Form.Group>
            <Form.Label>رمز عبور</Form.Label>
            <Form.Group className="mb-3" controlId="exampleForm.ControlInput1">
              <Form.Control
                type="password"
                autoFocus
              />
            </Form.Group>
          </Form>
        </Modal.Body>
        <Modal.Footer>
          <Button variant="secondary" onClick={handleClose2}>
            بستن
          </Button>
          <Button variant="primary" onClick={handleRegistration}>
            تایید
          </Button>
        </Modal.Footer>
      </Modal>
      </DropdownButton>
    </ButtonGroup>
      </Container>
      </Navbar>
      </header>
      <div>
      <Image src={require('../images/20.jpg')} style={{ width: '100%', height: '500px' }} />
      </div>
 <div className='text-center h1'>
 <h1 className='badge bg-primary m-3'>در مسیر تولید و توسعه ی پایدار نفت و گاز</h1>
 </div>
 <div className="d-flex flex-wrap text-center"> 
  <Card style={{ width: '18rem ' }} className='m-5'>
    <Image variant="top" src={require("../images/33.jpg")} />
    <Card.Body>
      <Card.Title>مدیر عامل شرکت نفت</Card.Title>
      <Card.Text>
      حدود ۳۶ میلیون دلار قرارداد به امضا رسانده‌ایم که همه آنها در حال اجرا و عملیاتی است.      </Card.Text>
      <Button variant="primary">ادامه</Button>
    </Card.Body>
  </Card>
  <Card style={{ width: '18rem' }} className='m-5'>
  <Image variant="top" src={require("../images/34.jpg")} />    <Card.Body>
      <Card.Title>امروز در جلسه</Card.Title>
      <Card.Text>
      احیای پروژه ی ملی ایران در دولت سیزدهم با نظارت مستقیم سهامداران این عرصه...      </Card.Text>
      <Button variant="primary">ادامه</Button>
    </Card.Body>
  </Card>
  <Card style={{ width: '18rem' }} className='m-5'>
  <Image variant="top" src={require("../images/35.jpg")} />
      <Card.Body>
      <Card.Title>صندوق های بازنشستگی</Card.Title>
      <Card.Text>
      نفت در چارچوب برنامه پایش وضعیت شرکت‌ها در پانصد و چهل و چهارمین نشست هیئت‌رئیسه صندوق‌های بازنشستگی صنعت...      </Card.Text>
      <Button variant="primary">ادامه</Button>
    </Card.Body>
  </Card>
  <Card style={{ width: '18rem' }} className='m-5'>
  <Image variant="top" src={require("../images/36.jpg")} />
      <Card.Body>
      <Card.Title>هیئت‌رئیسه</Card.Title>
      <Card.Text>
      شرکت عملیات اکتشاف دارای دو یارد در اهواز و تعداد هشت دکل حفاری است که از این هشت دکل تا سال ۱۴۰۰     
       </Card.Text>
      <Button variant="primary">ادامه</Button>
    </Card.Body>
  </Card>
</div>
<div style={{marginTop:'4cm'}}>
       <MyFooter />
       </div> 
    </div>
  );
}


export default Home;
