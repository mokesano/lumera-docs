---
title: Wizdam APIs Reference
description: API reference for Wizdam core services
order: 1
---

# Wizdam APIs Reference

This document provides technical reference for the Wizdam APIs.

## Base URL

```
https://api.example.com/v1
```

## Authentication

All API requests require authentication using Bearer tokens.

```bash
curl -H "Authorization: Bearer YOUR_TOKEN" \
     https://api.example.com/v1/endpoint
```

## Endpoints

### Authentication

#### POST /auth/login

Authenticate a user and receive an access token.

**Request Body:**

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| email | string | Yes | User email address |
| password | string | Yes | User password |

**Example Request:**

```json
{
  "email": "user@example.com",
  "password": "securepassword"
}
```

**Response:**

```json
{
  "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...",
  "expires_in": 3600,
  "token_type": "Bearer"
}
```

### Users

#### GET /users

Retrieve a list of users.

**Query Parameters:**

| Parameter | Type | Description |
|-----------|------|-------------|
| page | integer | Page number (default: 1) |
| limit | integer | Items per page (default: 20) |

**Response:**

```json
{
  "data": [
    {
      "id": 1,
      "email": "user@example.com",
      "name": "User Name"
    }
  ],
  "meta": {
    "page": 1,
    "limit": 20,
    "total": 100
  }
}
```

## Error Handling

The API uses standard HTTP status codes:

| Status Code | Description |
|-------------|-------------|
| 200 | Success |
| 400 | Bad Request |
| 401 | Unauthorized |
| 403 | Forbidden |
| 404 | Not Found |
| 500 | Internal Server Error |

**Error Response Format:**

```json
{
  "error": {
    "code": "ERROR_CODE",
    "message": "Human readable error message"
  }
}
```

## Rate Limiting

API requests are rate limited to 100 requests per minute per API key.

**Rate Limit Headers:**

```
X-RateLimit-Limit: 100
X-RateLimit-Remaining: 95
X-RateLimit-Reset: 1620000000
```

---

> 📝 **Note**: This is a placeholder API reference. Replace this content with your actual API documentation from the wizdam-apis repository.
