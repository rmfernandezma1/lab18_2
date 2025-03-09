# Use SDK image for building
FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build
WORKDIR /src

# Copy solution and project files
COPY ["Basic3TierAPI/Basic3TierAPI.csproj", "Basic3TierAPI/"]
COPY ["Basic3Tier.Core/Basic3Tier.Core.csproj", "Basic3Tier.Core/"]
COPY ["Basic3Tier.Infrastructure/Basic3Tier.Infrastructure.csproj", "Basic3Tier.Infrastructure/"]

# Restore dependencies
RUN dotnet restore "Basic3TierAPI/Basic3TierAPI.csproj"

# Copy the rest of the code
COPY . .

# Build the application
WORKDIR "/src/Basic3TierAPI"
RUN dotnet build "Basic3TierAPI.csproj" -c Release -o /app/build

# Publish the application
FROM build AS publish
RUN dotnet publish "Basic3TierAPI.csproj" -c Release -o /app/publish /p:UseAppHost=false

# Final stage/image
FROM mcr.microsoft.com/dotnet/aspnet:7.0 AS final
WORKDIR /app
COPY --from=publish /app/publish .
EXPOSE 80
EXPOSE 443

ENTRYPOINT ["dotnet", "Basic3TierAPI.dll"]