
{% macro markup( sellingprice, costpreice ) %}
({{sellingprice}} - {{costpreice}}  )/ {{costpreice}}
{% endmacro %}