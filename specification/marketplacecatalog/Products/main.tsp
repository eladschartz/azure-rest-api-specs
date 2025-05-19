import "@typespec/rest";
import "@typespec/versioning";
import "@azure-tools/typespec-azure-core";

using Http;
using Rest;
using Versioning;
using Azure.Core;

@service(#{ title: "Products" })
@versioned(Products.Versions)
namespace Products;

@doc("The Products API provides access to product and plan information.")
enum Versions {
  @useDependency(Azure.Core.Versions.v1_0_Preview_2)
  @doc("The first preview version of the API.")
  `2023-02-01-preview`,
}

@resource("CatalogApiResponse")
model CatalogApiResponse {
  @key("id")
  @doc("The unique identifier for the product.")
  id: string;
}

interface CatalogApiResponses {
  @doc("Get a standard response")
  getStandardResponse is ResourceRead<CatalogApiResponse>;
}
