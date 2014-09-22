package fi.haagahelia.pizza.service;

import java.util.List;

import fi.haagahelia.pizza.domain.Pizza;

public interface PizzaService {

	List<Pizza> getAllPizzas();
	Pizza getPizzaById(int id);
}
