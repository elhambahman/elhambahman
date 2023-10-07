import React, { useState } from 'react';
import '../App.css';
// Bootstrap CSS
import "bootstrap/dist/css/bootstrap.min.css";
// Bootstrap Bundle JS
import "bootstrap/dist/js/bootstrap.bundle.min";
import { Navbar,Image, Container , Nav, NavDropdown ,Button , CloseButton  , Card, ButtonGroup, DropdownButton,Dropdown,Modal, Form , Breadcrumb} from 'react-bootstrap';

function Header() {
  const [showLogin, setshowLogin] = useState(false);
  const [showSignup, setshowSignup] = useState(false);

  const handleClose = () => setshowLogin(false);
  const handleShow = () => setshowLogin(true);

  const handleClose2 = () => setshowSignup(false);
  const handleShow2 = () => setshowSignup(true);
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
          <Button variant="primary" onClick={handleClose}>
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
          <Button variant="primary" onClick={handleClose2}>
            تایید
          </Button>
        </Modal.Footer>
      </Modal>
      </DropdownButton>
    </ButtonGroup>
      </Container>
      </Navbar>
      </header>
      </div>
  );
}
  export default Header;
