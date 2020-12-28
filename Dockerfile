FROM mcr.microsoft.com/dotnet/sdk:5.0 AS base
WORKDIR /app

COPY . .
RUN dotnet publish GithubActionsDashboard/GithubActionsDashboard.csproj -c Release -o /app/artifacts/GithubActionsDashboard

HEALTHCHECK --retries=5 --interval=10s --timeout=1s CMD curl --fail http://localhost:8080/weatherforecast || exit 1

ENTRYPOINT ["dotnet", "/app/artifacts/GithubActionsDashboard/GithubActionsDashboard.dll", "--urls", "http://*:8080"]
