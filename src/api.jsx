export const API_URL = 'http://127.0.0.1:8080/api/v1/containers';

export const fetchContainers = async () => {
    const response = await fetch(API_URL);
    const data = await response.json();
    return data;
}
