FROM mcr.microsoft.com/dotnet/sdk:6.0 AS create
WORKDIR /src
COPY ./BlazingPizza .
RUN dotnet add package Microsoft.EntityFrameworkCore  --version 6.0.8
RUN dotnet add package Microsoft.EntityFrameworkCore.Sqlite  --version 6.0.8
RUN dotnet add package System.Net.Http.Json  --version 6.0.0
COPY ./Program.cs .
COPY ./PizzaStoreContext.cs Data/PizzaStoreContext.cs
COPY ./SeedData.cs Data/SeedData.cs
COPY ./SpecialsController.cs Controllers/SpecialsController.cs
COPY ./ConfigurePizzaDialog.razor Shared/ConfigurePizzaDialog.razor
COPY ./Index.razor Pages/Index.razor
COPY ./OrderState.cs Services/OrderState.cs


FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /src
COPY --from=create /src/BlazingPizza.csproj .
RUN dotnet restore
COPY --from=create /src .
RUN dotnet publish -c release -o /app


FROM mcr.microsoft.com/dotnet/aspnet:6.0
WORKDIR /app
COPY --from=build /app .
ENTRYPOINT ["dotnet", "BlazingPizza.dll"]