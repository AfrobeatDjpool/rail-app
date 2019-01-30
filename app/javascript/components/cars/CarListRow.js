import React from 'react';
import PropTypes from 'prop-types';

class CarListRow extends React.Component {
  constructor(props) {
    super(props); 
  }

  render() {
    
    return (
      <tr>
        <td>{this.props.patente}</td>
        <td>{this.props.dv_patente}</td>
        <td>{this.props.brand}</td>
        <td>{this.props.model}</td>
        <td>{this.props.tipo}</td>
        <td>{this.props.date_ult_trans}</td>
        <td>{this.props.created_at}</td>
        <td>{this.props.color}</td>
        <td>{this.props.rest_color}</td>
        <td>{this.props.ano_fab}</td>
        <td>{this.props.chasis}</td>
        <td>{this.props.numero_motor}</td>
        <td>{this.props.date_of_db}</td>
        <td>{this.props.rut}</td>
        <td>{this.props.dv}</td>
        <td>{this.props.first_name}</td>
      </tr>
    );
  }
}

CarListRow.propTypes = {
  brand: PropTypes.string,  
  id: PropTypes.number,
  patente: PropTypes.string,
  dv_patente: PropTypes.string,
  model: PropTypes.string,
  tipo: PropTypes.string,
  date_ult_trans: PropTypes.string,
  created_at: PropTypes.string,
  color: PropTypes.string,
  rest_colo: PropTypes.string,
  ano_fab: PropTypes.number,
  chasis: PropTypes.string,
  numero_motor: PropTypes.string,
  date_of_db: PropTypes.string,
  rut: PropTypes.number,
  dv: PropTypes.string,
  first_name: PropTypes.string,
};
export default CarListRow;
