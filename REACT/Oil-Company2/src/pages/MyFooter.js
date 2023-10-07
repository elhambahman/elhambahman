import React from 'react'
import '../App.css' ;
import "bootstrap/dist/css/bootstrap.min.css";
import "bootstrap/dist/js/bootstrap.bundle.min";
import {Row , Col , Image} from 'react-bootstrap';
import '../styles.css';

export default function MyFooter() {
  const listItemStyle = {
    marginBottom: '0.5cm',
  };

  return (
    <div className='bg-secondary' dir='rtl' style={{ height: '10cm' , display: 'flex', flexDirection: 'column'}}>
      <Row >
   <Col className='bg-secondary' dir='rtl' style={{ height: '10cm' }}>
   <h5 className='text-primary me-4 mt-4' style={{ borderBottom: '1px solid blue', width: '10cm', paddingBottom: '10px', marginTop: '1cm' }}>مطالب مرتبط</h5>
      <ul className='mt-3 me-3'>
        <li style={listItemStyle}>ثبت نظرات و شکایات </li>
        <li style={listItemStyle}>گروه صنایع پتروشیمی </li>
        <li style={listItemStyle}>گروه صنایع نفت و گاز</li>
        <li style={listItemStyle}>گروه صنایع سلولوزی</li>
        <li style={listItemStyle}> گروه فنی مهندسی</li>

      </ul>
            </Col>
            <Col>
            <h5 className='text-primary me-4 mt-4' style={{ borderBottom: '1px solid blue', width: '10cm', paddingBottom: '10px', marginTop: '1cm' }}>ارتباط با ما</h5>
            <ul className='mt-3 me-3'>
        <li style={listItemStyle}>آدرس : تهران _ خیابان سهروردی شمالی _ خیابان هویزه   </li>
        <li style={listItemStyle}>
امور سهام : ۴۲۵۷۵۰۰۰</li>
        <li style={listItemStyle}>تلفن : ۴۲۵۷۵۰۰۰-۰۲۱</li>
        <li style={listItemStyle}>گروه صنایع سلولوزی</li>
        <li style={listItemStyle}>فکس : ۸۸۵۲۴۵۲۱-۰۲۱</li>

      </ul>
        </Col>   
        <Col>
          <h5 className='text-primary me-4 mt-4' style={{ borderBottom: '1px solid blue', width: '7cm', paddingBottom: '6px', marginTop: '2cm' }}>نماد اعتماد</h5>
          <div style={{ display: 'flex', justifyContent: 'center' }}>
          <Image src={require('../images/38.png')} style={{ width: '50%', height: '50%' , marginTop:"30px" }} />
             </div>
       </Col>

        </Row>
    </div>
  )
}

