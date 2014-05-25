package br.com.ases.model.utilities;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

/**
 * Classe utilitária para ordenação de objetos de uma coleção(<code>java.util.Collection</code>) a partir ou não de um dos
 * atributos do objeto contido na lista.
 */
public class Ordenacao implements Comparator {

	private String campo;

	private static Ordenacao instance;

	private synchronized static Ordenacao getInstance() {
		if (instance == null) {
			instance = new Ordenacao();
		}
		return instance;
	}
	
	private Ordenacao() {
		super();
	}

	public int compare(Object primeiro, Object segundo) {
		Object o1 = null, o2 = null;
		Method getMethod = null;
		try {
			if (!(primeiro == null || segundo == null)) {
				if (primeiro instanceof String) {
					return ((String) primeiro).compareToIgnoreCase((String) segundo);
				}
				getMethod = primeiro.getClass().getDeclaredMethod(
						"get".concat(campo.substring(0, 1).toUpperCase()).concat(campo.substring(1)), null);

				o1 = getMethod.invoke(primeiro, null);
				o2 = getMethod.invoke(segundo, null);

				if (o1 != null && o2 != null && o1 instanceof Integer || o1 instanceof Float || o1 instanceof Double
						|| o1 instanceof Byte || o1 instanceof Long) {

					Double numero = new Double(String.valueOf(o1));
					return numero.compareTo(new Double(String.valueOf(o2)));
				}
				if (o1 != null && o2 != null) {
					return String.valueOf(o1).compareToIgnoreCase(String.valueOf(o2));
				}
			}
		} catch (NoSuchMethodException metodo) {
			throw new RuntimeException(metodo);
		} catch (InvocationTargetException invoke) {
			throw new RuntimeException(invoke);
		} catch (IllegalAccessException access) {
			throw new RuntimeException(access);
		}
		return -1;
	}

	/**
	 * M�todo responsável por retorna uma lista de Object ordenada pelo nome do campo informado
	 * 
	 * @param lista
	 * @param campo
	 * @return List
	 */
	public static List ordenarLista(List lista, String campo) {
		if (lista != null && !lista.isEmpty() && campo != null && !(campo.trim().length() == 0)) {
			getInstance().campo = (campo);
			Collections.sort(lista, getInstance());
		}else{
			getInstance().campo = ("tipoErro");
			Collections.sort(lista, getInstance());
			getInstance().campo = ("grupo");
			Collections.sort(lista, getInstance());
		}
		return lista;
	}
}