{include file = "header.tpl"}
<h1>Tabla Chocolates  </h1>
<table class="table table-striped table-dark">
    <thead>
        <th>Nombre Del Chocolate</th>
        <th>Nombre De la Marca</th>
        <th>Ver detalle </th>
        {if $logged}
            <th>Editar</th>
            <th>Eliminar</th>
        {/if}
    </thead>
    <tbody>
    {foreach from=$items item=$item}
        <tr>
            <td>{$item->nombre_chocolate}</td>
            <td>{$item->id_marca}</td>
            <td> <a href="detail/{$item->id_chocolate}" class="btn btn-outline-success" type="button"> Detalles del Producto</a></td>
            {if $logged}
                <td> <a href="edititem/{$item->id_chocolate}" class="btn btn-outline-success" type="button"> Editar</a></td>
            <td> <a href="deleteitem/{$item->id_chocolate}"class="btn btn-outline-danger" type="button">Eliminar</a></td>
            {/if}
            
        </tr>
    {/foreach}  
    </tbody>
</table>
{if $logged}
    
<h2>Agregar un chocolate </h2>
<form method="POST" action="additem" class="form-add" enctype="multipart/form-data">
    <label>Nombre del Chocolate.</label>
        <input type="text" placeholder="Nombre" name="namechocolate" class="form-control">
    <label>Precio.</label>
        <input type="text" placeholder="Precio" name="price" class="form-control">
    <label>Descripción.</label>
        <input type="text" placeholder="Descripcion" name="description" class="form-control">
    <label>Stock.</label>
    <input type="text" placeholder="Stock" name="stock" class="form-control">
    <label>Marca a la cual pertenece el Chocolate.</label>
    <select name="id_marca" class="form-control">
    {foreach from=$brands  item=$brand}
        <option
        {if {$brand->id_marca} == {{$items->id_marca}}} 
            selected = {$brand->id_marca}
        {/if}  
        value={$brand->id_marca}>{$brand->nombre_marca}</option>
    {/foreach}
    </select>  
    <div class="mt-4">
    <label>Agregar imagen</label>
    <input name="input_name" id="image" type="file" placeholder="archivo"></input>
    </div>
    <div class="mt-4">
        <ul class="ul">
        <li> <button class="btn btn-outline-success" type="submit"> Agregar </a></li>
        </ul>
    </div>
</form>
{/if}


<form method="POST" action="filter">
    <h3> Selecciona una marca para filtrar sus chocolates</h3>
        <select name="selected" class="form-selected">                                              
            {foreach from=$brands item=$brand }
                <option value="{$brand->id_marca}">{$brand->nombre_marca}</option>
            {/foreach}
            </select>
        <button type="submit"> Elegir </button>
    </form>

{include file = "footer.tpl"}








