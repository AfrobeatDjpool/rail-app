import React from "react"
import PropTypes from "prop-types"
import CarListRow from './CarListRow';

class CarsComponent extends React.Component {
	constructor(props) {
    super(props);    
	}

  render () {
  	const cars = this.props.cars;
    return (

      <table className="table">
		    <thead>
		      <tr>
		        <th>ddddddddddddddddddddd</th>
            <th>Dv_patente</th>
            <th>Brand</th>
            <th>Model</th>
            <th>Tipo</th>
            <th>Date_ult_trans</th>
            <th>Created At</th>
            <th>Color</th>
            <th>Rest_color</th>
            <th>Ano_fab</th>
            <th>Chasis</th>
            <th>Numero_motor</th>
            <th>Date Of db</th>   
            <th>Rut</th>
            <th>Dv</th>
            <th>name</th>
            <th>Fines</th>
		      </tr>
		    </thead>
		    <tbody>
		      {cars.map((car, index) => (
            <CarListRow
              key={index}
              id={car.id}
              brand={car.brand}
              patente={car.patente}
              dv_patente={car.dv_patente}
              model={car.model}
              tipo={car.tipo}
              date_ult_trans={car.date_ult_trans}
              created_at={car.created_at}
              color={car.color}
              rest_color={car.rest_color}
              ano_fab={car.ano_fab}
              chasis={car.chasis}
              numero_motor={car.numero_motor}
              date_of_db={car.date_of_db}
              rut={car.rut}
              dv={car.dv}
              first_name={car.first_name}
              fines={car.fines}
            />
          ))}
		    </tbody>
		  </table>
    );
  }
}

CarsComponent.propTypes = {
  cars: PropTypes.array,
  tableTitle: PropTypes.string
};
export default CarsComponent
