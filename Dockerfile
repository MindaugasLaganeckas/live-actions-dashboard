FROM mcr.microsoft.com/dotnet/core/aspnet:3.1 AS base
WORKDIR /app

ENV apiVersion=v1.0

LABEL product="threeshape.bat.services.github.app"
LABEL version="#GitVersion_SemVer"
LABEL InformationalVersion="#GitVersion_InformationalVersion"

COPY ./artifacts/threeshape.bat.services.github.app/ /app/

HEALTHCHECK --retries=5 --interval=10s --timeout=1s CMD curl --fail http://localhost/api/${apiVersion}/githubapp || exit 1

ENTRYPOINT ["dotnet", "threeshape.bat.services.github.app.dll"]
