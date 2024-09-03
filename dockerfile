# Use the official .NET 8.0 runtime image from Microsoft
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS base
WORKDIR /app

# Set the time zone to Asia/Jakarta
ENV TZ="Asia/Jakarta"
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN date

# Copy the compiled application to the container
COPY ./publish /app

# Expose the port your application will run on
EXPOSE 5000

# Set the environment variables and start the application
CMD ["dotnet", "hello-world.dll", "--urls=http://*:5000", "--pathbase=/"]
