import "@typespec/rest";
import "@typespec/versioning";
import "@azure-tools/typespec-azure-core";
import "./models.tsp";
import "./routes.tsp";

using TypeSpec.Http;
using TypeSpec.Rest;
using TypeSpec.Versioning;
using Azure.Core;

@service(#{ title: "Products" })
@server("https://catalogapi.azure.com")
@versioned(Products.Versions)
namespace Products;

@doc("The Products API provides access to product and plan information.")
enum Versions {
  @useDependency(Azure.Core.Versions.v1_0_Preview_2)
  @doc("The first preview version of the API.")
  `2023-02-01-preview`,
}

// Come back to see if this can be done cleaner
@route("/")
interface Operations extends ProductOperations {}
