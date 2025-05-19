import "@typespec/rest";
import "@typespec/versioning";
import "@azure-tools/typespec-azure-core";
import "./models.tsp";

using TypeSpec.Http;
using TypeSpec.Rest;
using Azure.Core;
using Products;

// Need to add an example to this
@route("/products")
@doc("Public Products API provides an unauthenticated endpoint for consuming commercial 3rd party Marketplace public products and 1st party Azure products. In addition, it enables Odata filtering on selected product properties.  Each API request must include an API key allocated to you (see X-API-Key description). Send an email to MKPL_Platform_API_DL@microsoft.com including the following details to get the API Key:\n- Customer name\n- Service/Product name\n- AD Registered App ID (if available)\n- Focal point email\n- Use case/scenario\n- Expected traffic volume, including peak requests per second (daily)")
@tag("ListingPublicProducts")
@get
op listProducts(): {
  @query("api-version")
  apiVersion: string;

  body: CatalogApiResponse;
};
