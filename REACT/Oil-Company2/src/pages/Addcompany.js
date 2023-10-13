import React, { useState } from 'react';
import "bootstrap/dist/css/bootstrap.min.css";
import "bootstrap/dist/js/bootstrap.bundle.min";
import '../App.css';
import MyFooter from './MyFooter';
import { Navbar, Nav, Container, Button, Tabs, Tab, Form , Row,Table , Accordion  } from 'react-bootstrap';

import { useNavigate } from 'react-router-dom';



export default function Addcompany() {
  const [barrel, setBarrel] = useState(0);
  const [price, setPrice] = useState(0);
  const [paymentAmount, setPaymentAmount] = useState(0);
  const [paymentDate, setPaymentDate] = useState(0);
  const [percentage, setPercentage] = useState(0);
  const [amount, setAmount] = useState(0);
  const [timestamp, setTimestamp] = useState(0);
  const [totalShares, setTotalShares] = useState(0);
  const [to, setTo] = useState('');
  const [chairman, setChairman] = useState('');
  const [manager, setManager] = useState('');
  const [paymentMethod, setPaymentMethod] = useState('');

  const navigate = useNavigate();

  const [selectedOption, setSelectedOption] = useState('');
  const [contractNumber, setContractNumber] = useState('');

  const handleSelectChange = (event) => {
    setSelectedOption(event.target.value);
  };

  const handleContractNumberChange = (event) => {
    setContractNumber(event.target.value);
  };

  return (
    <div dir='rtl'>
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
        <div className='text-center h1'>
           <h1 className='badge bg-primary m-3'>در مسیر تولید و توسعه ی پایدار نفت و گاز</h1>
        </div>
         <div>
         <Tabs
      defaultActiveKey="home"
      transition={false}
      id="noanim-tab-example"
      className="mb-3"
    >

<Tab eventKey="home" title="ثبت کمپانی جدید">
  <h3 className='m-4'>مشخصات کمپانی جدید</h3>
  <Form style={{ border: "0.5px solid black"}}>
  <div className="row me-3">
  <div className="col">
    <Form.Group className="mb-3">
      <Form.Label style={{fontSize : "20px" , margin:"10px"}}>نام کمپانی</Form.Label>
      <Form.Control style={{ border: "0.5px solid black"}} type="text" id="chairman" value={chairman} onChange={e => setChairman(e.target.value)}/>
    </Form.Group>
  </div>
  <div className="col">
    <Form.Group className="mb-3">
      <Form.Label style={{fontSize : "20px" , margin:"10px" }}>آدرس  کمپانی </Form.Label>
      <Form.Control style={{ border: "0.5px solid black"}} type="text" id="to" value={to} onChange={e => setTo(e.target.value)}  />
    </Form.Group>
  </div>
  <div className="col">
    <Form.Group className="mb-3">
      <Form.Label style={{fontSize : "20px" , margin:"10px"}}>مدیر مجموعه</Form.Label>
      <Form.Control style={{ border: "0.5px solid black"}} type="text" id="manager" value={manager} onChange={e => setManager(e.target.value)}/>
    </Form.Group>
  </div>
  <div className="col">
    <Form.Group className="mb-3">
      <Form.Label style={{fontSize : "20px" , margin:"10px"}}>روش پرداخت</Form.Label>
      <Form.Control style={{ border: "0.5px solid black"}} type="text" id="paymentMethod" value={paymentMethod} onChange={e => setPaymentMethod(e.target.value)}/>
    </Form.Group>
  </div>
</div>
  <div className="row me-3">
  <div className="col">
    <Form.Group className="mb-3" >
      <Form.Label style={{fontSize : "20px" , margin:"10px"}}>تعداد بشکه</Form.Label>
      <Form.Control style={{ border: "0.5px solid black"}} type="number" id="barrel" value={barrel} onChange={e => setBarrel(e.target.value)} />
    </Form.Group>
  </div>
  <div className="col">
    <Form.Group className="mb-3" controlId="formGroupEmail">
      <Form.Label style={{fontSize : "20px" , margin:"10px"}}>قیمت هر بشکه</Form.Label>
      <Form.Control style={{ border: "0.5px solid black"}} type="number" id="price" value={price} onChange={e => setPrice(e.target.value)}/>
    </Form.Group>
  </div>
  <div className="col">
    <Form.Group className="mb-3" >
      <Form.Label style={{fontSize : "20px" , margin:"10px"}}>مبلغ پرداختی</Form.Label>
      <Form.Control style={{ border: "0.5px solid black"}} type="number" id="paymentAmount" value={paymentAmount} onChange={e => setPaymentAmount(e.target.value)}/>
    </Form.Group>
  </div>
  <div className="col">
    <Form.Group className="mb-3" >
      <Form.Label style={{fontSize : "20px" , margin:"10px"}}>تاریخ پرداخت</Form.Label>
      <Form.Control style={{ border: "0.5px solid black"}} type="number" id="paymentDate" value={paymentDate} onChange={e => setPaymentDate(e.target.value)}/>
    </Form.Group>
  </div>
</div>
<div className="row me-3">
  <div className="col">
    <Form.Group className="mb-3">
      <Form.Label style={{fontSize : "20px" , margin:"10px"}}>درصد سهام </Form.Label>
      <Form.Control style={{ border: "0.5px solid black"}} type="number" id="percentage" value={percentage} onChange={e => setPercentage(e.target.value)} />
    </Form.Group>
  </div>
  <div className="col">
    <Form.Group className="mb-3">
      <Form.Label style={{fontSize : "20px" , margin:"10px"}}>شماره قرارداد </Form.Label>
      <Form.Control style={{ border: "0.5px solid black"}} type="number" id="amount" value={amount} onChange={e => setAmount(e.target.value)}/>
    </Form.Group>
  </div>
  <div className="col">
    <Form.Group className="mb-3">
      <Form.Label style={{fontSize : "20px" , margin:"10px"}}>تاریخ ثبت</Form.Label>
      <Form.Control style={{ border: "0.5px solid black"}} type="number" id="timestamp" value={timestamp} onChange={e => setTimestamp(e.target.value)} />
    </Form.Group>
  </div>
  <div className="col">
    <Form.Group className="mb-3">
      <Form.Label style={{fontSize : "20px" , margin:"10px"}}>کل سهام</Form.Label>
      <Form.Control style={{ border: "0.5px solid black"}}  type="number" id="totalShares" value={totalShares} onChange={e => setTotalShares(e.target.value)}/>
    </Form.Group>
  </div>
</div>
<button className="button m-3" type="submit" >ارسال برای بررسی</button>
    </Form>
</Tab>

<Tab eventKey="profile" title="کمپانی های در حال بررسی">
<Accordion defaultActiveKey="0">
      <Accordion.Item eventKey="0">
        <Accordion.Header>بررسی مشخصات کمپانی</Accordion.Header>
        <Accordion.Body>
        <h4>اطلاعات مربوط به سهامداران  کمپانی</h4>
          <br />     
          <br />

        <Table striped bordered hover>
      <thead>
        <tr>
          <th>#</th>
          <th>آدرس سهامدار</th>
          <th>آدرس مدیرعامل</th>
          <th> درصد سهام مدیرعامل</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>1</td>
          <td></td>
          <td></td>
          <td></td>
        </tr>
        <tr>
          <td>2</td>
          <td></td>
          <td></td>
          <td></td>
        </tr>
        <tr>
          <td></td>
          <td colSpan={2}></td>
          <td></td>
        </tr>
      </tbody>
    </Table>
    <br />
    <br />
         
        <br />
<h4>اطلاعات پرداختی کمپانی</h4>
          <br />     
          <br />

        <Table striped bordered hover>
      <thead>
        <tr>
          <th>#</th>
          <th>میزان  سود</th>
          <th>درصد سهام</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>1</td>
          <td></td>
          <td></td>
          <td></td>
        </tr>
        <tr>
          <td>2</td>
          <td></td>
          <td></td>
          <td></td>
        </tr>
        <tr>
          <td></td>
          <td colSpan={2}></td>
          <td></td>
        </tr>
      </tbody>
      </Table>
    <br />
    <br />
    <br />
    <h4>اطلاعات تولید برای کمپانی</h4>
    <br />
    <br />
        <Table striped bordered hover>
      <thead>
        <tr>
          <th>#</th>
          <th>تعداد بشکه های تولید شده در روز</th>
          <th>قیمت هر بشکه</th>
          <th>زمان ثبت تولید روزانه</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>1</td>
          <td></td>
          <td></td>
          <td></td>
        </tr>
        <tr>
          <td>2</td>
          <td></td>
          <td></td>
          <td></td>
        </tr>
        <tr>
          <td></td>
          <td colSpan={2}></td>
          <td></td>
        </tr>
      </tbody>
    </Table>
    <button className="button m-3 ml-40" type="submit" >عدم تایید </button>
    <button className="button m-3 ml-40" type="submit" >تایید اطلاعات </button>


        </Accordion.Body>
      </Accordion.Item>
      </Accordion>
</Tab>

      <Tab eventKey="Family" title="خانواده ی ما">
          <Form.Label style={{fontSize : "15px" , margin:"10px"}}>انتخاب خانواده</Form.Label>
          <Form.Select style={{ width: "400px" }} aria-label="Default select example" onChange={handleSelectChange}>
            <option>انتخاب</option>
      <option value="3">وارد کردن شماره قرارداد</option>
      <option value="1">آخرین قرارداد </option>
      <option value="2">مشاهده همه</option>
    </Form.Select>
    <br />
      <br />
      {selectedOption === '3' && (
        <Form style={{display :"flex"}}>
          <Form.Group controlId="contractNumber">
            <Form.Label style={{width: "330px"}}>شماره قرارداد</Form.Label>
            <Form.Control />
          </Form.Group>
          { <Button type="text" value={contractNumber} onChange={handleContractNumberChange} variant="primary"   className="btn-md m-3">تایید</Button>}
        </Form>
      )}
        {selectedOption === '1' && (
        <Table striped bordered hover>
          {<Accordion defaultActiveKey="0">
      <Accordion.Item eventKey="0">
        <Accordion.Header>آخرین قرارداد</Accordion.Header>
        <Accordion.Body>
        <h4>اطلاعات مربوط به سهامداران  کمپانی</h4>
          <br />     
          <br />

        <Table striped bordered hover>
      <thead>
        <tr>
          <th>#</th>
          <th>آدرس سهامدار</th>
          <th>آدرس مدیرعامل</th>
          <th> درصد سهام مدیرعامل</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>1</td>
          <td></td>
          <td></td>
          <td></td>
        </tr>
        <tr>
          <td>2</td>
          <td></td>
          <td></td>
          <td></td>
        </tr>
        <tr>
          <td></td>
          <td colSpan={2}></td>
          <td></td>
        </tr>
      </tbody>
    </Table>
    <br />
    <br />
         
        <br />
<h4>اطلاعات پرداختی کمپانی</h4>
          <br />     
          <br />

        <Table striped bordered hover>
      <thead>
        <tr>
          <th>#</th>
          <th>میزان  سود</th>
          <th>درصد سهام</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>1</td>
          <td></td>
          <td></td>
          <td></td>
        </tr>
        <tr>
          <td>2</td>
          <td></td>
          <td></td>
          <td></td>
        </tr>
        <tr>
          <td></td>
          <td colSpan={2}></td>
          <td></td>
        </tr>
      </tbody>
      </Table>
    <br />
    <br />
    <br />
    <h4>اطلاعات تولید برای کمپانی</h4>
    <br />
    <br />
        <Table striped bordered hover>
      <thead>
        <tr>
          <th>#</th>
          <th>تعداد بشکه های تولید شده در روز</th>
          <th>قیمت هر بشکه</th>
          <th>زمان ثبت تولید روزانه</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>1</td>
          <td></td>
          <td></td>
          <td></td>
        </tr>
        <tr>
          <td>2</td>
          <td></td>
          <td></td>
          <td></td>
        </tr>
        <tr>
          <td></td>
          <td colSpan={2}></td>
          <td></td>
        </tr>
      </tbody>
    </Table>
        </Accordion.Body>
      </Accordion.Item>
      </Accordion>}
        </Table>
      )}
           {selectedOption === '2' && (
        <Table striped bordered hover>
          { <Accordion>
      <Accordion.Item eventKey="0">
        <Accordion.Header>شماره قرارداد #1</Accordion.Header>
        <Accordion.Body>
        <h4>اطلاعات مربوط به سهامداران  کمپانی</h4>
          <br />     
          <br />

        <Table striped bordered hover>
      <thead>
        <tr>
          <th>#</th>
          <th>آدرس سهامدار</th>
          <th>آدرس مدیرعامل</th>
          <th> درصد سهام مدیرعامل</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>1</td>
          <td></td>
          <td></td>
          <td></td>
        </tr>
        <tr>
          <td>2</td>
          <td></td>
          <td></td>
          <td></td>
        </tr>
        <tr>
          <td></td>
          <td colSpan={2}></td>
          <td></td>
        </tr>
      </tbody>
    </Table>
    <br />
    <br />
         
        <br />
<h4>اطلاعات پرداختی کمپانی</h4>
          <br />     
          <br />

        <Table striped bordered hover>
      <thead>
        <tr>
          <th>#</th>
          <th>میزان  سود</th>
          <th>درصد سهام</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>1</td>
          <td></td>
          <td></td>
          <td></td>
        </tr>
        <tr>
          <td>2</td>
          <td></td>
          <td></td>
          <td></td>
        </tr>
        <tr>
          <td></td>
          <td colSpan={2}></td>
          <td></td>
        </tr>
      </tbody>
      </Table>
    <br />
    <br />
    <br />
    <h4>اطلاعات تولید و ارسال برای کمپانی</h4>
    <br />
    <br />
        <Table striped bordered hover>
      <thead>
        <tr>
          <th>#</th>
          <th>تعداد بشکه های تولید شده در روز</th>
          <th>قیمت هر بشکه</th>
          <th>زمان ثبت تولید روزانه</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>1</td>
          <td></td>
          <td></td>
          <td></td>
        </tr>
        <tr>
          <td>2</td>
          <td></td>
          <td></td>
          <td></td>
        </tr>
        <tr>
          <td></td>
          <td colSpan={2}></td>
          <td></td>
        </tr>
      </tbody>
    </Table>
        </Accordion.Body>
      </Accordion.Item>
      <Accordion.Item eventKey="1">
        <Accordion.Header> شماره قرارداد#2</Accordion.Header>
        <Accordion.Body>
        <h4>اطلاعات مربوط به سهامداران  کمپانی</h4>
          <br />     
          <br />

        <Table striped bordered hover>
      <thead>
        <tr>
          <th>#</th>
          <th>آدرس سهامدار</th>
          <th>آدرس مدیرعامل</th>
          <th> درصد سهام مدیرعامل</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>1</td>
          <td></td>
          <td></td>
          <td></td>
        </tr>
        <tr>
          <td>2</td>
          <td></td>
          <td></td>
          <td></td>
        </tr>
        <tr>
          <td></td>
          <td colSpan={2}></td>
          <td></td>
        </tr>
      </tbody>
    </Table>
    <br />
    <br />
         
        <br />
<h4>اطلاعات پرداختی کمپانی</h4>
          <br />     
          <br />

        <Table striped bordered hover>
      <thead>
        <tr>
          <th>#</th>
          <th>میزان  سود</th>
          <th>درصد سهام</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>1</td>
          <td></td>
          <td></td>
          <td></td>
        </tr>
        <tr>
          <td>2</td>
          <td></td>
          <td></td>
          <td></td>
        </tr>
        <tr>
          <td></td>
          <td colSpan={2}></td>
          <td></td>
        </tr>
      </tbody>
      </Table>
    <br />
    <br />
    <br />
    <h4>اطلاعات تولید برای کمپانی</h4>
    <br />
    <br />
        <Table striped bordered hover>
      <thead>
        <tr>
          <th>#</th>
          <th>تعداد بشکه های تولید شده در روز</th>
          <th>قیمت هر بشکه</th>
          <th>زمان ثبت تولید روزانه</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>1</td>
          <td></td>
          <td></td>
          <td></td>
        </tr>
        <tr>
          <td>2</td>
          <td></td>
          <td></td>
          <td></td>
        </tr>
        <tr>
          <td></td>
          <td colSpan={2}></td>
          <td></td>
        </tr>
      </tbody>
    </Table>
        </Accordion.Body>
      </Accordion.Item>
    </Accordion>}
        </Table>
      )}

      </Tab>
      </Tabs>
    </div>
      <div style={{marginTop:'4cm'}}>
         <MyFooter />
      </div>
    </div>

    
  );
}
