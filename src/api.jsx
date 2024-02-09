export const API_URL = 'http://192.168.0.101:5000/api/';

export const fetchContainers = async () => {
    const response = await fetch(API_URL);
    const data = await response.json();
    return data;
}
